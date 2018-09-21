require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Master < ActiveRecord::Base 
end

before do
	#вывод всех
	#@masters=Master.all 

	#вывод с сортировкой
	@masters=Master.order "created_at DESC"
end

get '/' do
	
	erb :index			
end

get '/visit' do
	
	erb :visit			
end

post '/visit' do
	@master      = params[ :master]
	@name        = params[ :name]
	@pfone       = params[ :pfone]
	@data_time   = params[ :data_time]
	@color       = params[ :color]
	    
	erb "<h2>Уважаемый #{@name}, Ваша запись сохранена, ждём Вас #{@data_time}.<h2/>"
	
end
