require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

#global var./initiate/access from each section
$rolodex= Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
end

get '/contacts/new' do
  erb :new_contact
end

# at the end of the file
post '/contacts' do
  puts params
end