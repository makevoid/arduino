require "arduino_firmata"

arduino = ArduinoFirmata.connect

pin_num = 2

loop do

  p arduino.analog_read pin_num
  sleep 0.5
  arduino.on :analog_read do |pin, value|

    if pin == pin_num
      puts "digital pin #{pin} changed : #{value}"
    end
  end
end
