require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :pfone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	if c.save

		erb "Спасибо, Вы записались!"
	else 
		erb "ERROR"
	end
		
end
