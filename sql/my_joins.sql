
/*
join
*/
--used to combine data from 2 or more tables through a common field usually a foreign key

USE Practice_DB;
GO

CREATE TABLE tmp.customer
(
    cust_id INT PRIMARY KEY IDENTITY,
    f_name VARCHAR(30) NOT NULL,
    l_name VARCHAR(30) NOT NULL
);
INSERT INTO 
    tmp.customer(f_name, l_name)
VALUES
    ('Sam', 'Miller'),
    ('Juan', 'Del Mar'),
    ('Gina', 'Stokes'),
    ('Dorothy', 'Crawford'),
    ('Michael', 'Allen'),
    ('Lori', 'Gutierrez'),
    ('Terrell', 'Wood');
SELECT * FROM tmp.customer;
CREATE TABLE tmp.orders
(
    o_id INT PRIMARY KEY IDENTITY,
    order_date DATE NOT NULL,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES tmp.customer(cust_id)
);
INSERT INTO
    tmp.orders(order_date, cust_id)
VALUES
    (GETDATE(), 2),
    (GETDATE(), 2),
    (GETDATE(), 5),
    (GETDATE(), 6),
    (GETDATE(), 3),
    (GETDATE(), 3),
    (GETDATE(), 2),
    (GETDATE(), 2),
    (GETDATE(), NULL),
    (GETDATE(), 6),
    (GETDATE(), 5),
    (GETDATE(), NULL);

SELECT * FROM tmp.orders;

/*
inner join
*/
--missing 2 orders b/c no customer associated with them
--missing customers who don't have any orders linked to them
SELECT * FROM tmp.orders o
INNER JOIN tmp.customer c
ON o.cust_id = c.cust_id;

/*
left join
*/
--returns all the rows from the left table and only the matching rows from the right table
--left table is table listed first in query
--right table is table listed second in query

--all records from left table (orders) are shown
--will display null where no customer info
SELECT * FROM tmp.orders o
LEFT JOIN tmp.customer c
ON o.cust_id = c.cust_id;

/*
right join
*/
--returns all rows from right table and only matching rows from left table
--all customers shown, no orders if no link to customers
SELECT * FROM tmp.orders o
RIGHT JOIN tmp.customer c
ON o.cust_id = c.cust_id;

/*
full outer join
*/
--return all rows for all orders

SELECT * FROM tmp.orders o
FULL JOIN tmp.customer c
ON o.cust_id = c.cust_id;

/*
multijoin
*/
--if you need to join multiple tables

USE BikeStores;

SELECT * FROM production.products;
SELECT * FROM production.brands;

--get product_id, name, brand name
SELECT product_id, product_name, brand_name
FROM production.products p
LEFT JOIN production.brands b
ON p.brand_id = b.brand_id;

--get product_id, name, brand name, category name
SELECT product_id, product_name, brand_name, category_name
FROM production.products p --left table
LEFT JOIN production.brands b --right table
ON p.brand_id = b.brand_id
LEFT JOIN production.categories c --right table
ON p.category_id = c.category_id;

--can add group by, order by, where, etc at the end
SELECT product_id, product_name, brand_name, category_name, list_price
FROM production.products p 
LEFT JOIN production.brands b 
ON p.brand_id = b.brand_id
LEFT JOIN production.categories c 
ON p.category_id = c.category_id
WHERE list_price < 1000;

/*
self join
*/
--join a table to itself
--compare rows within the same table

SELECT * FROM sales.staffs;

SELECT employee.first_name + ' ' + employee.last_name 'staff member',
	manager.first_name + ' ' + manager.last_name 'manager'
FROM sales.staffs employee --staff id (employee's id) --foreign key manager id
LEFT JOIN sales.staffs manager -- staff id (manager's id) --referenced foreign key is staff id
ON employee.manager_id = manager.staff_id;