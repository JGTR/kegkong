require "sinatra/activerecord"

class Measurement < ActiveRecord::Base
  belongs_to :keg



end



# Keg.get_data(sp)

# 5600 pulses per liter
# 3.78541 liters per gallon
# 5600 pulses per liter x 3.78541 = 21198.296 pulses per gallon
# formula = liters x pulses/liter x gallons/pulses