require "arduino_firmata"

arduino = ArduinoFirmata.connect


interval = 0.5 # half a second
led_on = false
time = Time.now.to_f

leds = 34..53
leds = (34..53).to_a - [40, 41, 42, 49, 50]
leds = (35..39).to_a + [65, 67, 66] + (43..48).to_a + [51, 52, 53]
leds_all = 0..85
cur = 0


leds_all.to_a.each do |led|
  arduino.digital_write led, false
end

loop do
  # all leds off
  # leds_all.to_a.each do |led|
  #   arduino.digital_write led, false
  # end

  arduino.digital_write leds[cur-1], false
  arduino.digital_write leds[cur], true
  # arduino.digital_write leds[cur]+1, true

  puts leds[cur]

  cur += 1

  if cur >= leds.size
    cur = 0
    cur
  end

  sleep 0.1

  # if Time.now.to_f - time > interval
  #   time = Time.now.to_f

  #   led_on = !led_on

  #   arduino.digital_write 12, led_on
  # end

end