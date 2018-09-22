require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
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
	@c=Client.new	
	erb :visit			
end

post '/visit' do
	
	@c=Client.new params[ :client]
	if @c.save

		erb "Спасибо, Вы записались!"
	else 
		@error=@c.errors.full_messages.first
		erb :visit
	end
		
end

get '/master/:id' do
	@master=Master.find(params[:id])
	erb :master
end

get '/bookings' do
	@clients=Client.order('created_at DESC')
	erb :bookings
end

get '/client/:id' do
  @client=Client.find(params[:id])
	erb :client
end
