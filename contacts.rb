require 'sinatra'
require 'sinatra/reloader'

require_relative 'database_persistance'

configure do
  @storage = DatabasePersistance.new
end

def load_contact(id)
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