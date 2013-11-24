require "arduino_firmata"

arduino = ArduinoFirmata.connect

leds = [
  { char: "a", color: "green", pin: 10, on: false },
  { char: "b", color: "red",   pin: 12, on: false },
]

leds.map do |led|
  arduino.digital_write led[:pin], led[:on]
end

loop do
  system "stty raw -echo"
  char = STDIN.read_nonblock(1) rescue nil
  system "stty -raw echo"
  break if /q/i =~ char

  leds.each do |led|
    if /#{led[:char]}/i =~ char
      led[:on] = !led[:on]
      arduino.digital_write led[:pin], led[:on]
    end
  end
end