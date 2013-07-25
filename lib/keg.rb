require "sinatra/activerecord"
require "gmail_sender"

class Keg < ActiveRecord::Base
  
  has_many :measurements, :dependent => :destroy

  def check_volume
    volume = self.max_volume.to_f
    volume = volume - self.measurements.sum('change_in_volume')
    # Previous code using iterator to arrive at current volume in Keg:
    # if self.measurements.size > 0
    #   self.measurements.each do |m|
    #     volume = volume - m.pulses/21198.296
        # puts m.change_in_volume.to_f
      #end
    #end
    volume
  end

  def send_email
    g = GmailSender.new("kegkongfis@gmail.com","grumpycat")
    g.send(:to => ["jordan.trevino@gmail.com",
      "joe.m.giralt@gmail.com", 
      "gonzales.chris.a@gmail.com"], 
      :subject => "Please Order a New Keg", 
      :content => "Keg ID: #{self.id} \n Keg Name: #{self.beer_type} \n Keg Volume: #{self.check_volume} \n :) KegKong thirsty...")
  end

end



