require 'sqlite3'

begin
  db = SQLite3::Database.open "RPGChar.db"
  db.execute "CREATE TABLE IF NOT EXISTS User(userID INTEGER PRIMARY KEY, name TEXT, password TEXT)"
  db.execute "INSERT INTO User VALUES(1, 'Bob', 'asdf')"

rescue SQLite3::Exception => e
  puts "Exception occured"
  puts e
  
ensure 
  db.close if db
end