-- Transactions

USE Practice_DB;

-- turn off autocommit
SET IMPLICIT_TRANSACTIONS OFF;


SELECT * FROM tmp.person;

BEGIN TRANSACTION;

INSERT INTO tmp.person(name, ssn)
    VALUES
        ('hello', '123456782'),
        ('hello', '123456781');

SELECT * FROM tmp.person;

-- the saved state of my db has 4 rows in my person table
COMMIT TRANSACTION;


BEGIN TRANSACTION;

-- transaction made up of 1 statement
UPDATE tmp.person SET name = 'different' WHERE name = 'hello';
SELECT * FROM tmp.person;

-- undo transaction so far to last commit (last saved state)
ROLLBACK;

-- this has 4 rows, with same names as before
SELECT * FROM tmp.person;


-- turn back on autocommits
SET IMPLICIT_TRANSACTIONS ON;

-- select * from tmp.person;

-- INSERT INTO tmp.person(name, ssn, dob, gender)
--                 VALUES('hello', '123456711', GETDATE(), 'F');

-- INSERT INTO tmp.person(name, ssn, dob, gender)
--                 VALUES('hello', '123456712', '1990-09-11', 'F');
