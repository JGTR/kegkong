# dummy_data.rb
# require_relative "./keg.rb"
# require_relative "./measurement.rb"
# require 'bundler'
# Bundler.require

# conversion = 21198.296

# Keg.create(:beer_type => "Budweister", :max_volume => "15.5")

# Measurement.create(:pulses => 5600, :change_in_volume => (5600/conversion), :belongs_to => 1)
# Measurement.create(:pulses => 9000, :change_in_volume => (9000/conversion), :belongs_to => 1)
# Measurement.create(:pulses => 5600, :change_in_volume => (5600/conversion), :belongs_to => 1)


# 5600 pulses per liter
# 3.78541 liters per gallon
# 5600 pulses per liter x 3.78541 = 21198.296
# formula = liters x pulses/liter x gallons/pulses