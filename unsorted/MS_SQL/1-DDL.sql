-- DATABASE DEFINITION LANGUAGE (DDL)

-- create a new dabase for testing
CREATE DATABASE Practice_DB;
GO

-- leave at top of file so you know which database is used 
USE Practice_DB;
GO

-- Schema -> collection of database objects (tables, views, triggers, etc.)
CREATE SCHEMA tmp;
GO


/*****************
* CREATE COMMAND *
******************/

-- Create table includes:
-- 1. name of table
-- 2. name of columns
-- 3. datatypes for each column (constraints are optional)

-- IDENTITY -> auto increment a numeric value, start at 1 and increment by one each time 
--             a new row is inserted
CREATE TABLE tmp.person 
(
    p_id INT PRIMARY KEY IDENTITY(1,1), -- start at 1, increment by 1
    name VARCHAR(30) NOT NULL,
    ssn CHAR(9) UNIQUE NOT NULL,
    dob DATE,
    gender CHAR(1) DEFAULT 'X'
                   CHECK( gender IN('F', 'M', 'X') )
);

-- describes a table's columns (data types, info on columns, etc.)
EXEC sp_columns person;




/****************
* ALTER COMMAND *
*****************/

-- alter used to add, modify, and delete columns in existing table

-- add a column
ALTER TABLE tmp.person ADD fave_color VARCHAR(15) NOT NULL;

-- modify column
-- don't forget to add in constraints you want keep (not null)
ALTER TABLE tmp.person ALTER COLUMN name VARCHAR(50) NOT NULL;

-- delete column
ALTER TABLE tmp.person DROP COLUMN fave_color;



/***************
* DROP COMMAND *
****************/

-- drop will delete an entire table (structure as well as data)

-- warning, be careful, once you drop something, its deleted forever
-- comment out your drops when not in use
-- DROP TABLE tmp.person;

-- address table is dependent on a value from person table
CREATE TABLE tmp.address
(
    a_id INT IDENTITY(1,1),
    street VARCHAR(100),
    person_id INT,
    PRIMARY KEY(a_id),
    FOREIGN KEY (person_id) REFERENCES tmp.person(p_id)
);

-- can't drop while address references person
-- DROP TABLE tmp.person;

-- remove address table (remove the foreign key) so you can drop person
-- DROP TABLE tmp.address;
-- DROP TABLE tmp.person;



/*******************
* TRUNCATE COMMAND *
********************/

-- truncate removes all records from a table w/o destroying the table structure

-- insert values
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456789', GETDATE(), 'F');
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456788', GETDATE(), 'F');
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456787', GETDATE(), 'F');

-- will have 3 records
SELECT * FROM tmp.person;

-- table still there, no records
TRUNCATE TABLE tmp.person;
SELECT * FROM tmp.person;

-- insert values again
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456789', GETDATE(), 'F');
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456788', GETDATE(), 'F');
INSERT INTO tmp.person(name, ssn, dob, gender)
                VALUES('hello', '123456787', GETDATE(), 'F');

-- 3 records, autoincrement is reset, so still see records starting from 1
SELECT * FROM tmp.person;



