require 'rubygems'
require 'bundler'

Dir.glob('./lib/*.rb') do |model|
  require model
end

Bundler.require

set :database, "sqlite3:///database.db"

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
      erb :show
    end

    get '/keg/reset' do
      @keg = Keg.last
      erb :reset
    end
  end
end

