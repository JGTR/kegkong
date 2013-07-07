require "sinatra/activerecord"

class Measurement < ActiveRecord::Base
  belongs_to :keg
  attr_accessor :sp

  def self.open_port
    # port_str = "/dev/ttyACM0" 
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    # @sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  end

  def self.get_data(keg)
    # while true do
      # pulses = @sp.gets('#delimeter') 
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
      Measurement.create(:pulses => 5600, :change_in_volume => convert_pulses, :keg_id => keg.id)
    # end
  end

  def self.convert_pulses
    # converts pulses to gallons
    #pulses / 21198.296
    2
  end


end



# Keg.get_data(sp)

# 5600 pulses per liter
# 3.78541 liters per gallon
# 5600 pulses per liter x 3.78541 = 21198.296 pulses per gallon
# formula = liters x pulses/liter x gallons/pulses