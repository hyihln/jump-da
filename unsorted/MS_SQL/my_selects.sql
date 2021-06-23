--select statements
--1. projection - choose the columns you want returned
--2. selection- how to filter rows out
--3. joining - bring data together from different tables

USE BikeStores;

--select all columns
SELECT * FROM sales.customers;

--select distinct columns
--get the relevant information you need from the table
SELECT first_name, last_name FROM sales.customers;

/*
arithmetic expressions
*/

SELECT * FROM production.products;

--what the price would be if 20% off sale
SELECT 
	product_name, 
	list_price * .80 --no column name
FROM production.products;

/*
column aliases 
- temporary name for results got back
*/

--quotes for multiple words column name
SELECT 
	product_name, 
	list_price * .80 AS '20% off Sale Price'
FROM production.products;

--no AS necessary for single word, use AS for clarity
SELECT 
	product_name, 
	list_price * .80 Price
FROM production.products;

SELECT 
	product_name, 
	list_price * .80 'Price'
FROM production.products;


/*
where 
- anything that follows where clause is condition for filtering
- can also be used in updates and deletes
*/

SELECT * FROM production.products
WHERE list_price > 3000;

SELECT * FROM production.products
WHERE list_price > 3000 AND model_year = '2017';


/*
order by
- sort by ascending or descending value of column
*/

--ascending value (A to Z, 1 to 100) default
SELECT * FROM sales.customers
ORDER BY first_name;

SELECT * FROM sales.customers
ORDER BY customer_id ASC; -- ASC to be clear but it's default

SELECT * FROM sales.customers
ORDER BY customer_id DESC; -- DESC need DESC

--multicolumn sorts
SELECT * FROM sales.customers
ORDER BY first_name, last_name;

/*
distinct
*/

--show no duplicates for viewing purpose 
--not deleted from database
SELECT DISTINCT first_name 
FROM sales.customers
ORDER BY first_name;

SELECT DISTINCT model_year FROM production.products;

SELECT DISTINCT model_year, category_id FROM production.products;

/*
logical conditions
- and , or, not
- checking conditions
- adding conditions or negating them
 */

 SELECT * FROM production.products
 WHERE model_year = '2016' AND list_price > 1000;

SELECT * FROM production.products
WHERE model_year = '2016' OR list_price > 1000;

SELECT * FROM production.products
WHERE NOT model_year = '2016';

SELECT * FROM production.products
WHERE model_year != '2016';

SELECT * FROM production.products
	WHERE list_price <= 2000;

SELECT product_name, list_price * .30 AS calc
FROM production.products
WHERE list_price * .30 < 2000;

/*
between
*/
-- the range for between will include 1000 and 2000
SELECT * FROM production.products
	WHERE list_price BETWEEN 1000 AND 2000;

SELECT * FROM production.products
	WHERE product_id BETWEEN 1 AND 4;

/*
in
- tests if value is in list given
*/

SELECT * FROM production.products
	WHERE brand_id IN(9,5,2); --cleaner than lots of OR

/*
like
--pattern matcher
--looks for a string pattern that matches it
*/

--find first names that start with an 'a'
SELECT first_name FROM sales.customers
WHERE first_name LIKE 'a%' -- % denotes 0 or more characters, gets every name that starts with a
ORDER BY first_name;

--the second character is an 'a'
SELECT first_name FROM sales.customers
WHERE first_name LIKE '_a%'
ORDER BY first_name;

--has a b in their name, 0 or more before and after their name
SELECT first_name FROM sales.customers
WHERE first_name LIKE '%b%'
ORDER BY first_name;

--ends with a
SELECT first_name FROM sales.customers
WHERE first_name LIKE '%a'
ORDER BY first_name;

--last letter is a or y
SELECT first_name FROM sales.customers
WHERE first_name LIKE '%[ay]'
ORDER BY first_name;

--starts with letters between x-z
SELECT first_name FROM sales.customers
WHERE first_name LIKE '[x-z]%'
ORDER BY first_name;

-- does not start with letters x, y, or z
SELECT first_name FROM sales.customers
WHERE first_name LIKE '[^x-z]%'
ORDER BY first_name DESC;

--select ids that end in 1
SELECT * FROM sales.customers
WHERE customer_id LIKE '%1';

--checking IS NULL and IS NOT NULL
SELECT * FROM sales.staffs
WHERE manager_id IS NULL;

SELECT * FROM sales.staffs
WHERE manager_id IS NOT NULL;

SELECT * FROM sales.staffs
WHERE manager_id IN (1,2) OR manager_id IS NULL;

/*
limiting rows
*/

--offset and fetch
--limit rows you get back and skip rows
--options when using order by clause

SELECT * FROM production.brands
ORDER BY brand_name
OFFSET 3 ROWS; --skips first 3 rows

--skip first 3, grab next 2
SELECT * FROM production.brands
ORDER BY brand_name
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY;

/*
select top
*/
--limit number of or % of rows
--use with order by clause

--5 most expensive products
SELECT TOP 5 * FROM production.products
ORDER BY list_price DESC;

--with ties got 6 rows back instead of 5 b/c of ties in price
SELECT TOP 5 WITH TIES
* 
FROM production.products
ORDER BY list_price DESC;

-- top 5 distinct 
SELECT DISTINCT list_price 
FROM production.products
ORDER BY list_price DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY; --fetch used with offset

--cleaner top 5 distinct
SELECT DISTINCT TOP 5 list_price 
FROM production.products
ORDER BY list_price DESC;

--select top 5% of rows, about 17 rows
SELECT DISTINCT TOP 5 PERCENT
*
FROM production.products
ORDER BY list_price DESC;

--top 5%, got more with ties about 21
SELECT DISTINCT TOP 5 PERCENT WITH TIES
*
FROM production.products
ORDER BY list_price DESC;