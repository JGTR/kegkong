require 'rubygems'
require 'bundler'

Dir.glob('./lib/*.rb') do |model|
  require model
end

Bundler.require


configure :development do
  set :database, "sqlite3:///database.db"
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/database.db')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

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

    get '/reset' do
      @keg = Keg.last
      erb :reset
    end

    get '/keg/:id' do 
      @keg = Keg.find(params[:id])
      erb :show
    end

    post '/keg/create' do
      @keg = Keg.create(params[:keg])
      erb :temp404
    end

    get '/pendejo' do
      @keg = Keg.last
      "work done"
    end


    post '/pendejo' do
      keg = Keg.last
      #keg.email_status = false
      @keg = Keg.last
      pulses = params[:pulses].to_i
      change_in_volume = pulses/21198.296
      @keg.measurements.build(:pulses => pulses, :change_in_volume => change_in_volume)
      @keg.save

      if !@keg.email_status && (@keg.check_volume < (@keg.max_volume * 0.25))
        @keg.send_email
        @keg.email_status = true
        @keg.save
      end
    end

  end
end

