CREATE TABLE IF NOT EXISTS User(
      userID INTEGER NOT NULL auto_increment, 
      name TEXT NOT NULL, 
      password TEXT NOT NULL,
      PRIMARY KEY (userID)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS System(
      systemID INTEGER NOT NULL auto_increment, 
      name TEXT NOT NULL, 
      dieSystem INT, 
      classBased INT NOT NULL,  
      genre TEXT, 
      PRIMARY KEY(systemID)) ENGINE=InnoDB;
  
CREATE TABLE IF NOT EXISTS Characters(
      charID INTEGER NOT NULL auto_increment, 
      name TEXT NOT NULL, 
      systemID INT NOT NULL,
      PRIMARY KEY(charID), 
      FOREIGN KEY(systemID) REFERENCES System(systemID)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Game(
      gameID INTEGER NOT NULL auto_increment, 
      systemID INT NOT NULL,
      PRIMARY KEY(gameID), 
      FOREIGN KEY(systemID) REFERENCES System(systemID)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Attribute(
      attrID INTEGER NOT NULL auto_increment, 
      name TEXT NOT NULL, 
      description TEXT NOT NULL,
      PRIMARY KEY(attrID)) ENGINE=InnoDB;

  CREATE TABLE IF NOT EXISTS UsesSystem(
      userID INT NOT NULL,
      systemID INT NOT NULL,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(systemID) REFERENCES System(systemID), 
      PRIMARY KEY(userID, systemID)) ENGINE=InnoDB;

  CREATE TABLE IF NOT EXISTS UserPlaysInGame(
      userID INT NOT NULL,
      gameID INT NOT NULL,
      charID INT NOT NULL,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(gameID) REFERENCES Game(gameID), 
      FOREIGN KEY(charID) REFERENCES Characters(charID),
      PRIMARY KEY(userID, gameID)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Permissions(
      userID INT NOT NULL,
      charID INT NOT NULL,
      permissionStatus INT NOT NULL,
      FOREIGN KEY(userID) REFERENCES User(userID), 
      FOREIGN KEY(charID) REFERENCES Characters(charID), 
      PRIMARY KEY(userID, charID)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS CharacterAttribute(
      charID INT NOT NULL,
      attrID INT NOT NULL,
      value TEXT NOT NULL, 
      FOREIGN KEY(charID) REFERENCES Characters(charID), 
      FOREIGN KEY(attrID) REFERENCES Attribute(attrID), 
      PRIMARY KEY(charID, attrID)) ENGINE=InnoDB;