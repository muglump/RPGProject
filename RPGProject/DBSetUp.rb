require 'sqlite3'

begin
  db = SQLite3::Database.open "RPGChar.db"
  db.execute "CREATE TABLE IF NOT EXISTS User(
      userID INTEGER PRIMARY KEY, 
      name TEXT, 
      password TEXT);"
  db.execute "CREATE TABLE IF NOT EXISTS System(
      systemID INTEGER PRIMARY KEY, 
      name TEXT, 
      dieSystem INT, 
      classBased INT,  
      genre TEXT);"
  db.execute "CREATE TABLE IF NOT EXISTS Character(
      charID INTEGER PRIMARY KEY, 
      name TEXT, 
      systemID INT,
      FOREIGN KEY(systemID) REFERENCES System(systemID));"
  db.execute "CREATE TABLE IF NOT EXISTS Game(
      gameID INTEGER PRIMARY KEY, 
      systemID INT,
      FOREIGN KEY(systemID) REFERENCES System(systemID))"
  db.execute "CREATE TABLE IF NOT EXISTS Attribute(
      attrID INTEGER PRIMARY KEY, 
      name TEXT, 
      desc TEXT)"
  db.execute "CREATE TABLE IF NOT EXISTS UsesSystem(
      userID INT,
      systemID INT,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(systemID) REFERENCES System(systemID), 
      PRIMARY KEY(userID, systemID))"
  db.execute "CREATE TABLE IF NOT EXISTS UserPlaysInGame(
      userID INT,
      gameID INT,
      charID INT,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(gameID) REFERENCES Game(gameID), 
      FOREIGN KEY(charID) REFERENCES Char(charID),
      PRIMARY KEY(userID, gameID))"
  db.execute "CREATE TABLE IF NOT EXISTS Permissions(
      userID INT,
      charID INT,
      permissionStatus INT,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(charID) REFERENCES Char(charID), 
      PRIMARY KEY(userID, charID))"
  db.execute "CREATE TABLE IF NOT EXISTS CharacterAttribute(
      charID INT,
      attrID INT,
      value TEXT, 
      FOREIGN KEY(charID) REFERENCES Char(charID), 
      FOREIGN KEY(attrID) REFERENCES Attribute(attrID), 
      PRIMARY KEY(charID, attrID))"

rescue SQLite3::Exception => e
  puts "Exception occured"
  puts e
  
ensure 
  db.close if db
end