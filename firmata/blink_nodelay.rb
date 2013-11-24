require "arduino_firmata"

arduino = ArduinoFirmata.connect


interval = 0.5 # half a second
led_on = false
time = Time.now.to_f

loop do

  if Time.now.to_f - time > interval
    time = Time.now.to_f

    led_on = !led_on

    arduino.digital_write 12, led_on
  end

end