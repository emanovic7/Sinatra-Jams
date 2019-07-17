require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end

  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/new' do

    erb :new
  end

  get '/artists/:id' do
  find_artist
    erb :show
  end

  post '/artists' do
    @artist = Artist.create(params)
    redirect to "/artists/#{@artist.id}"
  end

  get '/artists/:id/edit' do
    find_artist

    erb :edit
  end

  put '/artists/:id' do
    find_artist
    #binding.pry
    @artist.update(params[:artist])

    redirect to "/artists/#{@artist.id}"
  end

  delete '/artists/:id' do
    find_artist
    @artist.destroy

    redirect to '/artists'
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end


end
