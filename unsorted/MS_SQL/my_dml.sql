USE Practice_DB;

INSERT INTO tmp.person(name, ssn,dob, gender)
		VALUES('hello','123456786',GETDATE(),'F');

SELECT * FROM tmp.person;

INSERT INTO tmp.person(name,ssn)
		VALUES('hello','123456785');

SELECT * FROM tmp.person;

INSERT INTO tmp.person(name, ssn)
	VALUES
		('hello','123456784'),
		('hello','123456783');

SELECT * FROM tmp.person;


/*
update used to modify existing data in table
*/

UPDATE tmp.person
SET name = 'world'
WHERE p_id = 2;

SELECT * FROM tmp.person;

--update multiple columns
UPDATE tmp.person
SET name = 'hi', gender = 'M'
WHERE name = 'hello';

SELECT * FROM tmp.person;

--don't specify a where will update all records
UPDATE tmp.person
SET name = 'same name';

SELECT * FROM tmp.person;

/*
delete command
*/
--removing data from table

DELETE FROM tmp.person
WHERE p_id = 5;

SELECT * FROM tmp.person;

--if you don't specify where everything gets deleted
DELETE FROM tmp.person; 
SELECT * FROM tmp.person;

--a delete can be undone, a truncate is final (can't be undone, assuming no backups)
--deleting a whole table takes longer than truncating
-- (delete goes row by row)

INSERT INTO tmp.person(name, ssn)
	VALUES
		('hello','123456784'),
		('hello','123456783');

SELECT * FROM tmp.person;

TRUNCATE TABLE tmp.person; --in mssql resets id

INSERT INTO tmp.person(name, ssn)
	VALUES
		('hello','123456784'),
		('hello','123456783');

SELECT * FROM tmp.person;