require 'rubygems'
require 'sinatra'
require 'haml'
require 'sequel'
require 'mysql2'
require 'bcrypt'

class HelperMethods
  def self.open_connection()
    file = File.new("Password.txt", "r")
    username = file.gets.strip
    password = file.gets.strip
    
    db = Mysql2::Client.new(
        :host => '127.0.0.1', 
        :database => "rpgchar", 
        :username => username, 
        :password => password)
  end
end

get '/' do
  db = HelperMethods.open_connection()
  
  haml :login 
end

post '/success' do
  db = HelperMethods.open_connection()
  
  name = params[:username]
  pass = params[:password]
  
  return_code = db.query("SELECT RPGChar.AddUser('#{name}', '#{pass}') AS return_code")
  
  haml :success, :locals => {:return_code => return_code}
end