require 'sqlite3'

begin
  db = SQLite3::Database.open "RPGChar.db"
  db.execute "CREATE TABLE IF NOT EXISTS User(userID INTEGER PRIMARY KEY, name TEXT, password TEXT)"
  
  db.execute "INSERT INTO User VALUES(1, 'Bob', 'asdf')"
  
  stm = db.prepare "SELECT * FROM User WHERE userID=? AND name=?"
  stm.bind_params( 1, 'Bob' )
  rows = stm.execute
  
  puts rows.next
  
  stm.close if stm
  
  stm = db.prepare "DELETE FROM User WHERE userID=?"
  stm.execute(1)

rescue SQLite3::Exception => e
  puts "Exception occured"
  puts e
  
ensure 
  stm.close if stm
  db.close if db
end
