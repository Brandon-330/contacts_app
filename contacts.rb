require 'sinatra'
require 'pg'

require_relative 'database_persistance'

configure(:development) do
  require 'sinatra/reloader'
  also_reload 'database_persistance.rb'
end

configure do
  enable :sessions
  also_reload 'database_persistance.rb'
end

before do
  @storage = DatabasePersistance.new
end

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = @storage.all_contacts
  erb :contacts
end

get '/contacts/:id' do
  id = params[:id].to_i
  erb :contact
end