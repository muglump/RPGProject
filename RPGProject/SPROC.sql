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

DROP FUNCTION RPGChar.LogInUser;

-- Returns 0 on successful login
-- Returns 1 on invalid login information
-- TODO: Change to a procedure that returns success and uid
CREATE FUNCTION RPGChar.LogInUser(
		_Username text, 
		_Password text)
RETURNS int
BEGIN 
	IF (SELECT Password FROM User WHERE name = _Username) = _Password THEN
		RETURN 0;
	END IF;
	RETURN 1;
END //