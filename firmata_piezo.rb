require "arduino_firmata"

arduino = ArduinoFirmata.connect


# piezo light led


# switch off the rgb led
arduino.digital_write 6, true
arduino.digital_write 9, true
arduino.digital_write 10, true

treshold = 30
@on = false
wait = 0

arduino.on :analog_read do |pin, value| # analog_read event
  if pin == 0
    puts "val: #{value}, wait: #{wait}"
    if value > treshold &&  wait == 0
      arduino.digital_write 10, !@on
      @on = !@on
      wait = 1500
    end
  end
end

# mosfet is 5

loop do
  unless wait <= 0
    wait = wait - 150
  else
    wait = 0
  end
  sleep 0.1
end



arduino.close
