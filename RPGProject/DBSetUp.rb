require 'mysql2'

begin
  file = File.new("Password.txt", "r")
  username = file.gets.strip
  password = file.gets.strip
  
  db = Mysql2::Client.new(
      :host => '127.0.0.1', 
      :database => "rpgchar", 
      :username => username, 
      :password => password)
      
      db.query("INSERT INTO User(name, password) VALUES('Andrew', 'asdf');")
      rows = db.query("SELECT * FROM User;")
      rows.each do |row|
        puts row
      end
      
      db.query("DELETE FROM User WHERE name='Andrew';")
      
rescue Mysql2::Error => e
  puts "Exception occured"
  puts e
  
ensure 
  db.close if db
end