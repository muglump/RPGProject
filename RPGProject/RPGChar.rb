require 'sinatra'
require 'haml'

get '/' do
  haml :login 
end

post '/success' do
  haml :success, :locals => params
end
