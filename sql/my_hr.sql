USE HR_DB;
GO

SELECT * FROM dbo.employees
ORDER BY salary DESC;

--1. 3 employees with lowest salary
SELECT TOP 3 *
FROM dbo.employees
ORDER BY salary ASC;

--2. employee with second highest salary whose phone number begins with 515
SELECT *
FROM dbo.employees
WHERE phone_number LIKE '515%'
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--3. find the name, salary, and hire date of all employees hired before 1995 and a salary over 10,000
SELECT first_name, last_name, salary, hire_date
FROM dbo.employees
--WHERE hire_date <'1997-01-01' AND salary > 10000;
WHERE YEAR(hire_date) < '1997' AND salary > 10000;

--4. get all unique salaries
SELECT DISTINCT salary
FROM dbo.employees;

--5. list each unique salary and how many make that salary
SELECT DISTINCT salary, COUNT(salary) AS 'how many make this salary'
FROM dbo.employees
GROUP BY salary;

--6. group employees by department id, find averge of each department, order lowest to highest
SELECT department_id, AVG(salary) AS 'average salary'
FROM dbo.employees
GROUP BY department_id
ORDER BY [average salary] ASC;

--7. find all employees hired between 1995 and 1997
--a. order employed by department id and hire date
SELECT employee_id, department_id, hire_date
FROM dbo.employees
WHERE hire_date BETWEEN '1995' AND '1997' --does not include 95 and 97
ORDER BY department_id, hire_date;
--b. use over and partition by to list average salary for department next to each row
SELECT *, AVG(salary) OVER(PARTITION BY(department_id)) AS 'average salary for department'
FROM dbo.employees;

--8. select average salary of employee per department, if odd when rounded, don't include it
SELECT employee_id, AVG(salary) OVER(PARTITION BY(department_id)) AS 'avg'
FROM dbo.employees
GROUP BY
HAVING ROUND()
ORDER BY AVG(salary);