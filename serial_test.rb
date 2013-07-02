#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)
require 'rubygems'
require "serialport"
require 'debugger'
#params for serial port
port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

data = []
counter = 0

while true do 
  sp_char = sp.getc
  # if sp_char
  #   printf("%c", sp_char)
  # end
  if sp_char && sp_char.start_with?("pulses:")
    number = sp_char.split(":")[1]
    puts number
  end
end


# def collect
#   data.
# end
# data << line
# counter += 1

sp.close   