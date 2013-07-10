#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)

require 'rubygems'
require "serialport"
require 'sqlite3'
require "sinatra/activerecord"
require_relative './lib/keg.rb'
require_relative './lib/measurement.rb'
require 'debugger'

ActiveRecord::Base.establish_connection(
   :adapter   => 'sqlite3',
   :database  => './database.db'
)

# db = SQLite3::Database.new "database.db"

#params for serial port
# port_str = "/dev/ttyACM0"
# baud_rate = 9600
# data_bits = 8
# stop_bits = 1
# parity = SerialPort::NONE

# sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

keg = Keg.last
keg.email_status = false
keg.save

while true do
   # keg_id = db.execute("SELECT id FROM kegs ORDER BY ID DESC LIMIT 1")[0][0]
   # pulses = sp.gets("\r\n").chomp.split(':')[1].to_i
  #  pulses = 2000
  #  if pulses > 70 && pulses < 8000
  #    measurement = keg.measurements.build(:pulses => pulses, :change_in_volume => pulses/21198.296)
  #    measurement.save
  #    # db.execute("INSERT INTO measurements VALUES(null, :pulses, 2.0, :keg_id, null, null)", {:pulses => pulses, :keg_id => keg_id})  
  # end


  if !keg.email_status && (keg.check_volume < (keg.max_volume * 1))
  	keg.send_email
  	keg.email_status = true
  end

  # if !Keg.last.email_status && (Keg.last.check_volume < (Keg.last.max_volume * 0.90))
  # 	Keg.last.send_email
  # 	Keg.last.email_status = true
  # end

end

# sp.close   
