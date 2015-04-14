require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact # kind of acting like a module

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String

end


DataMapper.finalize #finish indicating keys
DataMapper.auto_upgrade! #will modify table if keys are add/del

get '/' do
  @crm_app_name = "Aila's CRM"
	erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/contacts/:id/edit" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
    if @contact
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.notes = params[:notes]

      @contact.save
      redirect to("/contacts")
    else
      raise Sinatra::NotFound
    end
end

post '/contacts' do
  new_contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    notes: params[:notes]
    )

  redirect to('/contacts')
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to ("/contacts")
  else
    raise Sinatra::NotFound
  end
end

#temp user id == 1000
# $rolodex.add_contact(Contact.new("Jonny", "Bravo", "johnny@bitmakerlabs.com", "Rockstart"))


