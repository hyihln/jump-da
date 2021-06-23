/*
set operators*/
--combine data from 2 or more queries

USE Practice_DB;
GO

CREATE SCHEMA setop;
GO
CREATE TABLE setop.student
(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(30) NOT NULL,
    dob DATE,
    dept VARCHAR(30) NOT NULL
);
INSERT INTO setop.student(name, dob, dept)
VALUES
    ('Raphael', '1984-09-23', 'Computer Science'),
    ('Donatello', '1984-07-20', 'Computer Science'),
    ('Michaelangelo', '1984-09-23', 'Accounting'),
    ('Leonardo', '1984-11-17', 'History');
SELECT * FROM setop.student;
CREATE TABLE setop.professor
(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(30) NOT NULL,
    dob DATE,
    dept VARCHAR(30) NOT NULL,
    phone VARCHAR(10)
);
INSERT INTO setop.professor(name, dob, dept, phone)
VALUES
    ('Blossum', '1984-09-23', 'Computer Science', '111-1111'),
    ('Buttercup', '1995-04-13', 'History', '121-1221'),
    ('Bubbles', '1991-12-01', 'Computer Science', '211-1112'),
    ('Mojo Jojo', '1984-09-23', 'Art', '222-1111'),
    ('Leonardo', '1984-11-17', 'History', '111-2222');
SELECT * FROM setop.professor;

/*
union
*/
--combine results from 2 select statements into a single result set
/*
requirements
1. number and order of columns from 2 statements are same
2. data types of columns must be same or compatible
*/

SELECT * FROM setop.student;
SELECT * FROM setop.professor;

--get all names and dept from student and professor
SELECT name, dept FROM setop.student
	UNION
SELECT name, dept FROM setop.professor;

--varchar compatible
SELECT name,dept, dob FROM setop.student
	UNION
SELECT name, phone, dob FROM setop.professor;

--union won't contain duplicates
--union all allows for duplicates
SELECT name, dept FROM setop.student
	UNION ALL
SELECT name, dept FROM setop.professor;

/*
intersect
*/
--combine results of 2 queries and returns only same

SELECT dept FROM setop.student
	INTERSECT
SELECT dept FROM setop.professor;

/*
except
*/
--take first query and remove any rows that are the same with second query

--departments unique to student, not in professor table
--subtract from first
SELECT dept FROM setop.student
	EXCEPT
SELECT dept FROM setop.professor;