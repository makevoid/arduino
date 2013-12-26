require "arduino_firmata"

arduino = ArduinoFirmata.connect

pin = 3

loop do
  arduino.digital_write pin, true
  sleep 4
  arduino.digital_write pin, false
  sleep 3
end