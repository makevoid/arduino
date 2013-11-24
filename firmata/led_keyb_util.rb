require "arduino_firmata"

arduino = ArduinoFirmata.connect


leds_all = 0..85
leds_all.to_a.each do |led|
  arduino.digital_write led, false
end

cur = 30


loop do
  system "stty raw -echo"
  char = STDIN.read_nonblock(1) rescue nil
  system "stty -raw echo"
  break if /q/i =~ char



  if char
    leds_all.to_a.each do |led|
      arduino.digital_write led, false
    end

    arduino.digital_write cur, true
    puts cur
    cur += 1
  end
end