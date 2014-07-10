require 'sinatra'

get '/' do
  erb :index
end

post '/users/new' do
  user = params[:username]
  redirect '/users/' + user
end

get '/users/:username/?' do
  @url = get_badges params[:username]
  erb :show
end

def get_badges user
  url = 'http://www.codecademy.com/users/'+ user +'/achievements'
  url
end
