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
	
	c=Client.new params[ :client]
	c.save

	erb "Спасибо, Вы записались!"
		
end
