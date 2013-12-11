require "arduino_firmata"

arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"

pin_b = 6
pin_r = 10
pin_g = 9

loop do
  arduino.digital_write pin_r, false
  sleep 0.2
  arduino.digital_write pin_r, true
  sleep 0.4

  arduino.digital_write pin_r, false
  sleep 0.2
  arduino.digital_write pin_r, true
  sleep 0.4

  arduino.digital_write pin_g, false
  sleep 0.2
  arduino.digital_write pin_g, true
  sleep 0.4

  arduino.digital_write pin_b, false
  sleep 0.2
  arduino.digital_write pin_b, true
  sleep 0.6

  # puts arduino.analog_read 0

  # arduino.on :analog_read do |pin, value|
  #   if pin == 1
  #     puts "analog pin #{pin} changed : #{value}"
  #   end
  # end
end
