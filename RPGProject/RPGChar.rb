require 'rubygems'
require 'time'
require 'sinatra'
require 'haml'
#require 'sequel'
require 'mysql2'
require 'bcrypt'

configure do
  enable :sessions
end

class HelperMethods
  def self.open_connection()
    file = File.new("Password.txt", "r")
    username = file.gets.strip
    password = file.gets.strip
    file.close
    
    db = Mysql2::Client.new(
        :host => '127.0.0.1', 
        :database => "rpgchar", 
        :username => username, 
        :password => password)
  end
end

get '/' do
  haml :index
end

get '/register?' do
  haml :register
end

=begin
get '/login' do
  haml :index
end
=end

post '/login' do
  # get the name and password posted
  name = params[:username]
  pass = params[:password]
  
  # TODO: Sanitize input
  # TODO: Hash password
  
  db = HelperMethods.open_connection()
  
  return_code = db.query("SELECT RPGChar.LogInUser('#{name}', '#{pass}') AS return_code")
  
  db.close
  
  # extract the return code
  count = 0
  rc = nil
  return_code.each do |code|
    if count > 0
      puts "Error: Multiple logged in at once."
      file = File.new("log.txt", "w")
      file.puts("Errror: Multiple accounts logged in at once. " + Time.now.getutc.to_i.to_s)
      file.close
      
      crash
    end
    
    rc = code["return_code"]
    count += 1
  end
  
  if rc == 0
    # TODO: switch name with uid
    session[:username] = name
  end
  
  haml :login, :locals => {:return_code => rc, :username => name}
end

post '/success' do
  # get the name and password posted
  name = params[:username]
  pass = params[:password]
  
  # TODO: Sanitize input
  # TODO: Hash passwords

  db = HelperMethods.open_connection()
  
  return_code = db.query("SELECT RPGChar.AddUser('#{name}', '#{pass}') AS return_code")
  
  db.close
  
  # extract the return code
  count = 0
  rc = nil
  return_code.each do |code|
    if count > 0
      puts "Error: Multiple accounts created at once."
      file = File.new("log.txt", "w")
      file.puts("Errror: Multiple accounts created at once. " + Time.now.getutc.to_i.to_s)
      file.close
      
      crash
    end
    
    rc = code["return_code"]
    count += 1
  end
  
  haml :success, :locals => {:return_code => rc}
end

get '/userpage/:username' do
  if params[:username] == session[:username]
    haml :myuserpage
  else
    # Check permissions
    redirect '/insufficient_credentials'
  end
end

get '/insufficient_credentials' do
  haml :insufficient_credentials
end
