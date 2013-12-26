require "arduino_firmata"

arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"

pin = 13

loop do
  arduino.digital_write pin, true
  sleep 0.2
  arduino.digital_write pin, false
  sleep 0.2

  # puts arduino.analog_read 0

  # arduino.on :analog_read do |pin, value|
  #   if pin == 1
  #     puts "analog pin #{pin} changed : #{value}"
  #   end
  # end
end
