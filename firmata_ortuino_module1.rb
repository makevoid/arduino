require "arduino_firmata"

# moisture sensor
# relay > water pump

relay_pin = 3
moist_apin = 0
moist_dpin = 9
MOISTURE_DRY = 750

arduino = ArduinoFirmata.connect
arduino.pin_mode moist_dpin, ArduinoFirmata::INPUT
@arduino = arduino

watering = false

arduino.on :analog_read do |pin, value|
  if pin == moist_apin
    if (value % 5) == 0
      puts value
      if value > MOISTURE_DRY && !watering
        puts "WATERING!!!!"
        watering = true
      end
    end
  end
end

def water(relay_pin)
  @arduino.digital_write relay_pin, true
  sleep 2
  @arduino.digital_write relay_pin, false
  sleep 5
end

loop do
  arduino.digital_write relay_pin, false
  puts arduino.analog_read  moist_apin

  if watering
    water relay_pin
    watering = false
  end

  sleep 2
end
