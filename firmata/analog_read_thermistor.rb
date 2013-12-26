require "arduino_firmata"

arduino = ArduinoFirmata.connect

pin_num = 2

arduino.on :analog_read do |pin, value|
  if pin == pin_num
    puts "analog pin #{pin} changed : #{value}"
  end
end

loop do

  p arduino.analog_read pin_num
  sleep 0.5

end
