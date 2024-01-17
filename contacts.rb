require 'sinatra'
require 'sinatra/reloader' 

#require_relative 'database_persistance'

configure do
  @storage = DatabasePersistance.new
end

get '/' do
  redirect '/home'
end

get '/contacts' do
  @names = ['Vicky', 'Reginald', 'Dora']
  erb :contacts
end

get '/contacts/:id' do
  @contact = params[:id]
  erb :contact
end