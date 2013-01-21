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