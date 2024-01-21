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

helpers do
  def format_phone_number(number_int)
    number = number_int.to_s
    "(#{number[0, 3]})-#{number[3, 3]}-#{number[6, 4]}"
  end
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
  @contact = @storage.find_contact(id)
  erb :contact
end