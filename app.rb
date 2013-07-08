require 'rubygems'
require 'bundler'

Dir.glob('./lib/*.rb') do |model|
  require model
end

Bundler.require

set :database, "sqlite3:///database.db"

Measurement.open_port
kong_test = Keg.create(:beer_type => "Indio", :max_volume => "15.5")
Measurement.get_data(kong_test)

module KegKong
  
  class App < Sinatra::Application

    get '/' do
      @keg = Keg.last
      erb :home
    end

    get '/index' do
      @kegs = Keg.all
      erb :index
    end

    get '/subscribe' do 
      "Coming soon!"
    end

    get '/keg/:id' do 
      @keg = Keg.find(params[:id])
    end

  end
end

