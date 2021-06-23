USE HR_DB;

SELECT * FROM dbo.employees;

-- 1. Find the 3 employees with the lowest salaries
SELECT TOP 3
    first_name,
    last_name,
    salary 
FROM dbo.employees
ORDER BY salary;


-- 2. Find the employee with the 2nd highest salary who is has a phone number that begins with 515.
SELECT
    first_name,
    last_name,
    phone_number,
    salary 
FROM dbo.employees
WHERE
    phone_number LIKE '515%'
ORDER BY salary DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;


-- 3. Find the name, salary, and hire date of all employees hired before 1995 and a salary over $10,000.
SELECT
    first_name,
    last_name,
    salary,
    hire_date
FROM dbo.employees
WHERE 
    hire_date < '1995-01-01'
    AND 
    salary > 10000;


-- 4. Get all the unique salaries in the employee table. 
SELECT DISTINCT salary FROM dbo.employees ORDER BY salary;


-- 5. List each unique salary and how many people make that salary.
SELECT 
    salary, 
    COUNT(salary) 
FROM dbo.employees 
GROUP BY salary;


-- 6. Group employees by department id, find the average salary of each department. Order them from lowest salary to highest.
SELECT 
    department_id, 
    AVG(salary) as 'AVG SALARY'
FROM dbo.employees 
GROUP BY department_id
ORDER BY AVG(salary);


-- 7. Find all the employees hired between 1995 - 1997.
SELECT
    first_name,
    last_name,
    salary,
    department_id,
    hire_date
FROM dbo.employees
WHERE 
    hire_date BETWEEN '1995-01-01' AND '1997-12-31';


-- 7.a. Order the employed by their department id and hire date
SELECT
    first_name,
    last_name,
    salary,
    department_id,
    hire_date
FROM dbo.employees
WHERE 
    hire_date BETWEEN '1995-01-01' AND '1997-12-31'
ORDER BY 
    department_id, hire_date;


-- 7.b. Using OVER & PARTITION BY, list the average salary for their department next to each row
SELECT
    first_name,
    last_name,
    salary,
    department_id,
    hire_date,
    AVG(salary) OVER(PARTITION BY department_id) as 'DEPT AVG SALARY'
FROM dbo.employees
WHERE 
    hire_date BETWEEN '1995-01-01' AND '1997-12-31'
ORDER BY 
    department_id, hire_date;



-- 8. If the average salary of the department is odd when rounded, don’t include it
SELECT 
    department_id,
    AVG(salary) 
FROM dbo.employees
GROUP BY
    department_id
HAVING
    ROUND( AVG(salary), 0 ) % 2 = 0;








