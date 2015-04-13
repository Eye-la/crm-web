require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

#global var./initiate/access from each section
$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "Aila's CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/contacts/:id/edit" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
    if @contact
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.notes = params[:notes]

      redirect to("/contacts")
    else
      raise Sinatra::NotFound
    end
end

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
    if @contact
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.notes = params[:notes]

      redirect to("/contacts")
    else
      raise Sinatra::NotFound
    end
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to ("/contacts")
  else
    raise Sinatra::NotFound
  end
end

#temp user id == 1000
# $rolodex.add_contact(Contact.new("Jonny", "Bravo", "johnny@bitmakerlabs.com", "Rockstart"))


