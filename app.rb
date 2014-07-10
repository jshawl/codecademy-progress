require 'sinatra'
require 'nokogiri'
require 'open-uri'


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
  doc = Nokogiri::HTML(open( url ))
  p doc
  @badges = []
  doc.css('.achievement-card').each do |l|
    p "*********"
    name = l.css('h5').text
    @badges << name
  end
  @badges
end
