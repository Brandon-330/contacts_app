require 'sinatra'
require 'sinatra/reloader' 

require_relative 'database_persistance'

configure do
  @storage = DatabasePersistance.new
end

get '/' do
  redirect '/home'
end

get '/home' do
  @names = ['Vicky', 'Reginald', 'Dora']
  erb :home
end