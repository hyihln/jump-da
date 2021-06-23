

USE BikeStores;
GO

-- Create View

CREATE VIEW sales.customer_contact
AS
SELECT 
    first_name,
    last_name,
    email,
    phone
FROM sales.customers;
GO

-- access view with select statement
SELECT * FROM sales.customer_contact;

-- street column not part of view definition
-- SELECT street FROM sales.customer_contact;


-- treat it like you would a table
SELECT 
    first_name,
    phone
FROM sales.customer_contact
WHERE
    phone IS NOT NULL
ORDER BY 
    first_name;
GO


-- Update View
ALTER VIEW sales.customer_contact
AS
SELECT 
    first_name + ' ' + last_name 'name',
    email,
    phone
FROM sales.customers;
GO

SELECT * FROM sales.customer_contact;


-- Delete View
DROP VIEW IF EXISTS sales.customer_contact;

-- DROP VIEW sales.customer_contact;



