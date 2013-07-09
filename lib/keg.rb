require "sinatra/activerecord"
require "gmail_sender"

class Keg < ActiveRecord::Base
  
  has_many :measurements, :dependent => :destroy

  def check_volume
    volume = self.max_volume.to_f
    if self.measurements.size > 0
      self.measurements.each do |m|
        puts volume
        volume = volume - m.pulses/21198.296
        # puts m.change_in_volume.to_f
      end
    end
    volume
  end

  def send_email
    g = GmailSender.new("kegkongfis@gmail.com","grumpycat")
    g.send(:to => ["jordan.trevino@gmail.com","joe.m.giralt@gmail.com", "gonzales.chris.a@gmail.com"], :subject => "Order a New Keg", :content => "Now Please. We Thirstaaaaay...")
  end

end


  def self.convert_pulses
    # converts pulses to gallons
    #pulses / 21198.296
    2
  end



