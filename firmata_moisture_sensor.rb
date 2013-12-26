require "arduino_firmata"



moist_apin = 0
moist_dpin = 9

arduino = ArduinoFirmata.connect
arduino.pin_mode moist_dpin, ArduinoFirmata::INPUT



@last_value = 0

arduino.on :analog_read do |pin, value|

  if pin == moist_apin# && value < @last_value
    if (value % 10) == 0
      puts "lv: #{@last_value}"
      puts "pin #{pin} changed: #{value}"
      @last_value = value
    end
  end
end

loop do
  puts arduino.digital_read moist_dpin
  puts arduino.analog_read  moist_apin
  sleep 1
end
