require "arduino_firmata"

arduino = ArduinoFirmata.connect


# mosfet light dimming

brightness  = 0
fade_speed  = 10

# switch off the rgb led
arduino.digital_write 6, true
arduino.digital_write 9, true
arduino.digital_write 10, true


# mosfet is 5

loop do

  brightness += fade_speed

  arduino.analog_write 5, brightness

  if brightness <= 0 || brightness > 50
    fade_speed = -fade_speed
    sleep 2
  end

  sleep 0.05
end



arduino.close