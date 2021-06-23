USE BikeStores;
GO

--create a view

CREATE VIEW sales.customer_contact AS
SELECT 
	first_name,
	last_name,
	email,
	phone
FROM sales.customers;
GO

--restict information only have access to contact information
SELECT * FROM sales.customer_contact;

--can treat a view like a table
SELECT 
	first_name,
	phone
FROM sales.customer_contact
WHERE phone IS NOT NULL
ORDER BY first_name;
GO

--update view
ALTER VIEW sales.customer_contact AS
SELECT 
	first_name + ' ' + last_name 'name',
	email,
	phone
FROM sales.customers;
GO

SELECT * FROM sales.customer_contact;

--delete a view
DROP VIEW IF EXISTS sales.customer_contact;

--error b/c view does not exist
--DROP VIEW sales.customer_contact;