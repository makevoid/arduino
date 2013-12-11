require "arduino_firmata"

@arduino = arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"

@pin_b = 6
@pin_r = 10
@pin_g = 9

@red     = 0
@green   = 0
@blue    = 0
# @fade_speed  = 20
# @sleep = 0.03
# @sleep_sequence = 0.3
@fade_speed  = 20
@sleep = 1
@sleep_sequence = 5


def red

  loop do
    @red += @fade_speed
    @arduino.analog_write @pin_r, @red.abs

    if @red <= 0 || @red > 255
      @fade_speed = -@fade_speed
      sleep @sleep_sequence
      break
    end

    sleep @sleep
  end

end


def green

  loop do
    @green -= @fade_speed
    @arduino.analog_write @pin_g, @green.abs

    if @green <= 0 || @green > 255
      @fade_speed = -@fade_speed
      sleep @sleep_sequence
      break
    end

    sleep @sleep
  end

end

def blue

  loop do
    @blue += @fade_speed
    @arduino.analog_write @pin_b, @blue.abs

    if @blue <= 0 || @blue > 255
      @fade_speed = -@fade_speed
      sleep @sleep_sequence
      break
    end

    sleep @sleep
  end

end

loop do
  # @arduino.analog_write @pin_r, 255
  # @arduino.analog_write @pin_g, 255
  # @arduino.analog_write @pin_b, 255
  # sleep 1

  # initialization
  @arduino.analog_write @pin_r, 0
  sleep 1
  @arduino.analog_write @pin_r, 255

  red

  green

  blue

end

# loop do

#   arduino.digital_write pin_r, false
#   sleep 0.2
#   arduino.digital_write pin_r, true
#   sleep 0.4

#   arduino.digital_write pin_r, false
#   sleep 0.2
#   arduino.digital_write pin_r, true
#   sleep 0.4

#   arduino.digital_write pin_g, false
#   sleep 0.2
#   arduino.digital_write pin_g, true
#   sleep 0.4

#   arduino.digital_write pin_b, false
#   sleep 0.2
#   arduino.digital_write pin_b, true
#   sleep 0.6

#   # puts arduino.analog_read 0

#   # arduino.on :analog_read do |pin, value|
#   #   if pin == 1
#   #     puts "analog pin #{pin} changed : #{value}"
#   #   end
#   # end
# end
