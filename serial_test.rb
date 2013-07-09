#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)

I
require 'rubygems'
require "serialport"
require 'sqlite3'
db = SQLite3::Database.new "database.db"
# set :database, "sqlite3:///database.db"


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
 pulses = sp.gets("\r\n")
 keg_id = db.execute("SELECT id FROM kegs ORDER BY ID DESC LIMIT 1;")
 now = Time.now
 db.execute("INSERT INTO measurements VALUES(null, :pulses, 2.0, :keg_id, null, null)", {:pulses => pulses, :keg_id => keg_id}) 
end


sp.close   