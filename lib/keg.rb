require "sinatra/activerecord"

class Keg < ActiveRecord::Base
  
  has_many :measurements, :dependent => :destroy

  def check_volume
    volume = self.max_volume.to_f
    if self.measurements.size > 0
      self.measurements.each do |m|
        puts volume
        volume = volume - m.change_in_volume.to_f
        # puts m.change_in_volume.to_f
      end
    end
    volume
  end

end





