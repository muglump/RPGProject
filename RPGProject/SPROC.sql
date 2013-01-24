DROP FUNCTION RPGChar.AddUser;

DELIMITER //

-- Returns 0 on successful insert
-- Returns 1 on prexisting username
CREATE FUNCTION RPGChar.AddUser(
		_Username text,
		_Password text)
RETURNS int
BEGIN
 	IF EXISTS (SELECT * FROM User WHERE name = _Username) THEN
 		RETURN 1;
 	END IF;
 
 	
 
 	-- Insert the new user
 	INSERT INTO User(Name, Password)
 		Values(_Username, _Password);
 	
 	-- Return success
 	RETURN 0;
END //

DROP FUNCTION RPGChar.LogInUser
DELIMITER //
-- Returns 0 on successful login
--Returns 1 on invalid login information
CREATE FUNCTION RPGChar.LogInUser(
		_Username text, 
		_Password text)
RETURNS int
BEGIN 
 IF (Select Password from User Where name = _ Username) = _Password THEN
 	RETUrn 0;
 return 1;