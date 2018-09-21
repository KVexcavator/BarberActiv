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
	
	@name        = params[ :name]
	@pfone       = params[ :pfone]
	@data_time   = params[ :data_time]
	@master      = params[ :master]
	@color       = params[ :color]

	#хеш сообщений об ошибке
	hh={ :name       => "Enter name",
       :pfone      => "Enter pfone",
       :data_time  => "Enter date and time",
	}

	@error=hh.select{|key,_| params[key]==''}.values.join(', ')
	if @error !=''
		return erb :visit
	end

	if @name !="" and @pfone!="" and @data_time!=""
			
			Client.create :name => @name,
		                :pfone => @pfone,
			              :datestamp => @data_time,
			              :master => @master,
			              :color => @color

	    
	    erb "<h2>Уважаемый #{@name}, Ваша запись сохранена, ждём Вас #{@data_time}.<h2/>"
	end
		
end
