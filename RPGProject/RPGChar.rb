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
    uri = "mysql://" + username + ":" + password + "@localhost/RPGChar"
    db = Sequel.mysql2(
        :host => '127.0.0.1', 
        :database => "rpgchar", 
        :username => username, 
        :password => password)
  end
end

get '/' do
  db = HelperMethods.open_connection()
  
  db["User"]
  
  haml :login 
end

post '/success' do
  db = HelperMethods.open_connection()
  
  name = params[:username]
  pass = params[:password]
  
  func = db.select(AddUser(name, pass))
  
  return_code = func.run()
  
  haml :success, :locals => {:return_code => return_code}
end