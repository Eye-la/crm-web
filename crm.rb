require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

#global var./initiate/access from each section
$rolodex= Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
	erb :index
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts' do

  erb :contacts
end

get '/add_contact' do
  erb :add_contact
end
