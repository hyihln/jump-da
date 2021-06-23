-- DATA MANIPULATION LANGUAGE (DML)
-- used to manipulate data in a database

USE Practice_DB;


/*****************
* INSERT COMMAND *
******************/

-- insert is used to add new rows of data

-- insert by stating table(col1, col2, etc.) VALUES (val1, val2, etc.)
-- only state columns we will give values for insert
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456786', GETDATE(), 'F');

SELECT * FROM tmp.person;

-- can remove columns if not required for inserting a new row (id, dob, gender)
INSERT INTO tmp.person(name, ssn)
                VALUES('hello', '123456785');
SELECT * FROM tmp.person;


-- multi inserts -> inserts with a single statement
INSERT INTO tmp.person(name, ssn)
    VALUES
        ('hello', '123456784'),
        ('hello', '123456783');

SELECT * FROM tmp.person;




/*****************
* UPDATE COMMAND *
******************/

-- update used to modify existing data in a table

-- updating one record
UPDATE tmp.person
SET name = 'world'
WHERE p_id = 2;

SELECT * FROM tmp.person;

-- update multiple columns
UPDATE tmp.person
SET name = 'hi', gender = 'M'
WHERE name = 'hello';

SELECT * FROM tmp.person;

-- don't specify a where, will update all records
UPDATE tmp.person
SET name = 'same name';

SELECT * FROM tmp.person;



/*****************
* DELETE COMMAND *
******************/

-- removing data from table

-- delete from table, specify condition
DELETE FROM tmp.person
WHERE p_id = 5;

SELECT * FROM tmp.person;


-- if you don't specify a where clause, everything gets deleted
DELETE FROM tmp.person;

-- empty table
SELECT * FROM tmp.person;


-- a delete can be undone, a truncate is final (can't recover that data)
-- deleting a whole table takes longer than truncating it



INSERT INTO tmp.person(name, ssn)
    VALUES
        ('hello', '123456784'),
        ('hello', '123456783');

SELECT * FROM tmp.person;


TRUNCATE TABLE tmp.person;

INSERT INTO tmp.person(name, ssn)
    VALUES
        ('hello', '123456784'),
        ('hello', '123456783');

SELECT * FROM tmp.person;

