require "arduino_firmata"

arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"


brightness  = 0
fade_speed  = 20

loop do

  brightness += fade_speed

  arduino.analog_write 5, brightness

  if brightness <= 0 || brightness > 255
    fade_speed = -fade_speed
  end

  sleep 0.2
end
