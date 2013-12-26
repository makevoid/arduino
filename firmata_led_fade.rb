require "arduino_firmata"

arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"


brightness  = 0
fade_speed  = 15 # 25 - 1, 3, 5, 9, 15, 25, 45, 75, 225

led_pin = 3


loop do

  brightness += fade_speed

  arduino.analog_write led_pin, brightness

  if brightness <= 0 || brightness >= 255
    sleep 1
    fade_speed = -fade_speed
  end

  sleep 0.1
end
