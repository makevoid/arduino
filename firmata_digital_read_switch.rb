require "arduino_firmata"

arduino = ArduinoFirmata.connect
puts "firmata version #{arduino.version}"


loop do

  puts arduino.digital_read 12
  sleep 0.5

  arduino.on :digital_read do |pin, value|
    if pin == 12
      puts "digital pin #{pin} changed : #{value}"
    end
  end
end
