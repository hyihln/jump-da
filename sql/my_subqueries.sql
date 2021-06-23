/*
subqueries
-query within query
-return data used by outer query
*/

USE BikeStores;
GO

-- find order id, order data, customer id of customers with phone numbers
SELECT * FROM sales.orders;
SELECT * FROM sales.customers;

-- find customers with phone numbers
SELECT * FROM sales.customers
WHERE phone IS NOT NULL;

-- query to get information in orders table
SELECT order_id, order_date, customer_id FROM sales.orders;

-- combined queries
--combined link in queries is customer id, IN for list
SELECT order_id, order_date, customer_id FROM sales.orders 
WHERE customer_id IN (
	SELECT customer_id FROM sales.customers 
	WHERE phone IS NOT NULL
);

--
SELECT AVG(list_price)
FROM production.products;

--products above average list_price
SELECT product_name, list_price FROM production.products
WHERE list_price > (
		SELECT AVG(list_price) FROM production.products
		);

/*
correlated subqueries
*/
--inner query that depends on information from outer query
--inner query have accessto information in outer query

--find all products list price above average for their category
/*SELECT 
	prodouter.product_id, 
	prodouter.product_name, 
	prodouter.list_price, category_id, 
	AVG(prodouter.list_price) OVER(PARTITION BY (prodouter.category_id)) 'category average'
FROM production.products prodouter
WHERE list_price > (
	SELECT AVG(list_price)
	FROM production.products prodinner
	WHERE prodinner.category_id = prodouter.category_id
);
*/

--highest list price in its category
SELECT
	product_name,
	list_price,
	category_id
FROM production.products p1
WHERE
	list_price IN (
		SELECT MAX(p2.list_price)
		FROM production.products p2
		WHERE p2.category_id = p1.category_id
		GROUP BY p2.category_id
	);
