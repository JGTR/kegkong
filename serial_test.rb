#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)

require 'rubygems'
require "serialport"
require 'faraday'


#params for serial port
port_str = "/dev/ttyACM0"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

while true do
   pulses = sp.gets("\r\n").chomp.split(':')[1].to_i

   if pulses > 300 && pulses < 8000
     conn = Faraday.new(:url => 'http://www.kegkong.com')
     conn.post("/pendejo", {:pulses => pulses, :change_in_volume => pulses/21198.296}) 
   end

end

sp.close   
