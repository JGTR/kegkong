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

#just read forever
 i =  sp.gets.chomp        # see note 2

sp.close                       #see note 1
