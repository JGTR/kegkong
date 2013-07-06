require "sinatra/activerecord"

class Measurement < ActiveRecord::Base
  belongs_to :keg

end