USE BikeStores;

/*
group by
*/

SELECT * FROM production.products;

--group by for model year
--only access model year, not very useful
SELECT model_year FROM production.products 
GROUP BY model_year;

--use aggregate functions
--how mnay products have this model year
SELECT 
	model_year, 
	COUNT(*) AS '# of products' 
FROM production.products 
GROUP BY model_year;

SELECT 
	brand_id, 
	COUNT(*) AS '# of products' 
FROM production.products 
GROUP BY brand_id;

-- count rows in whole table
SELECT 
	COUNT(*) AS '# of products' 
FROM production.products;


/*
having
*/
--set conditions like a where clause

SELECT 
	model_year, 
	COUNT(*) AS '# of products' 
FROM production.products 
GROUP BY model_year
HAVING COUNT(*) <100;

--
SELECT 
	model_year, 
	COUNT(*) AS '# of products' 
FROM production.products 
GROUP BY model_year
HAVING model_year != 2016;

--can still have where clause, needs to be before group by to filter before it gets grouped
SELECT 
	model_year, 
	COUNT(*) AS '# of products' 
FROM production.products 
WHERE list_price > 2000
GROUP BY model_year
HAVING model_year != 2016;

/*
aggregate functions
*/
--return a value after performing calculation on a set column

SELECT 
	model_year,
	COUNT(*) AS '# of products' ,
	AVG(list_price) AS 'avg list price',
	MAX(list_price) AS 'highest list price',
	MIN(list_price) AS 'lowest list price',
	SUM(list_price) AS 'sum of list price'
FROM production.products 
GROUP BY model_year;

SELECT 
	model_year,
	COUNT(*) AS '# of products' ,
	AVG(list_price) AS 'avg list price',
	MAX(list_price) AS 'highest list price',
	MIN(list_price) AS 'lowest list price',
	SUM(list_price) AS 'sum of list price'
FROM production.products 
GROUP BY model_year;

--highest average
SELECT TOP 1
	AVG(list_price)
FROM production.products
GROUP BY model_year
ORDER BY
	 AVG(list_price) DESC;

/*
over and partition by
over clause
-1.determine which rows from query applied to a function
-2.can be used to display group by calculations next to regular rows
*/

USE Practice_DB;

CREATE TABLE tmp.student
(
    s_id INT IDENTITY,
    name VARCHAR(30) NOT NULL,
    team VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    gpa DECIMAL NOT NULL
);
INSERT INTO 
    tmp.student(name, team, age, gpa) 
VALUES
    ('Sam 1', 'red', 20, 4.0),
    ('Sam 2', 'blue', 22, 3.0),
    ('Sam 3', 'blue', 19, 3.5),
    ('Sam 3.5', 'blue', 22, 2.7),
    ('Sam Alpha', 'green', 25, 3.19),
    ('Sam Beta V2', 'red', 20, 3.6),
    ('Sam', 'red', 22, 1.8),
    ('Samwise Gamgee', 'blue', 22, 4.0),
    ('S.A.M.', 'red', 18, 2.88),
    ('Sam™', 'green', 27, 3.22);

SELECT * FROM tmp.student;

-- can display normal data from column and aggregations
SELECT 
	s_id, 
	name, 
	team, 
	COUNT(*) OVER(PARTITION BY(team)) 'team count',
	AVG(gpa) OVER(PARTITION BY(team)) 'team avg gpa'
FROM tmp.student
ORDER BY s_id;