--Select * from sales.staffs;

/*
Database Definition Language
Create a new database for testing
*/

create database Practice_DB;

--GO to not get warning, doesn't like other queries after create
go

--switch over from masters without doing it manually from dropdown
--leave use at top of file to know which db is used

--highlight to run/execute single line

use Practice_DB;
go

--schema -> collection of database objects (tables, views, triggers, )
create schema tmp;
go

/*
Create command
create table includes:
1. name of table
2. name of columns
3. datatypes for each column (constraints are optional)
*/

--under schema tmp
--identity -> auto increment a numeric value, default start at 1 and increment by 1 each time new row inserted
create table tmp.person
(
	p_id int primary key identity(1,1), -- default can leave it identity
	name varchar(30) not null,
	ssn char(9) unique not null,
	dob date,
	gender char(1) default 'X'
					check(gender in ('F','M','X') )
);

--quick look at what the column and datatype is if not working with dbms, ex terminal
--describes a table's columns (data types, info in columns, etc.)
exec sp_columns person;


/*
alter command
--alter used to add, modify, and delete columns in existing table
--easier to alter structure if there's no data in it
*/

--add a column
ALTER TABLE tmp.person ADD fave_color VARCHAR(15) NOT NULL;

-- modify column
--ex: rejection if length 30 to 20 and there's data in there

-- don't forget to add in constraints you want to keep
-- or you would lose it ex: not null to null
ALTER TABLE tmp.person ALTER COLUMN name varchar(50) NOT NULL;

--delete column
ALTER TABLE tmp.person DROP COLUMN fave_color;

--most of time error cannot be run is data already in there, or conflicting with new command


/*
drop command
drop deletes an entire table (structure as well as data inside)
permanent unless data backed up, 
be careful
*/
--comennt out drop when not in use or manually delete to avoid accidently running drop

--DROP TABLE tmp.person;
--keep scripts separate


--address table dependent on a value from the person table
CREATE TABLE tmp.address
(
	a_id INT IDENTITY(1,1),
	street VARCHAR(100),
	person_id INT,
	PRIMARY KEY(a_id), --useful when need to set up composite keys (a_id, street)
	FOREIGN KEY (person_id) REFERENCES tmp.person(p_id)

);


--can't drop while address references person
--DROP TABLE tmp.person;

--remove address to remove foreign key
--DROP TABLE tmp.address;
--DROP TABLE tmp.person;



/*
truncate command
--remove records from tables
--remove records without destroying the table structure
--reset table
*/

INSERT INTO tmp.person(name, ssn, dob, gender) -- id auto generated
		VALUES('hello','123456789',GETDATE(), 'F');

INSERT INTO tmp.person(name, ssn, dob, gender) -- id auto generated
		VALUES('hello','123456788',GETDATE(), 'F');

SELECT * FROM tmp.person;

TRUNCATE TABLE tmp.person; --flush data, reset, start at 1, maintain data structure

SELECT * FROM tmp.person;
