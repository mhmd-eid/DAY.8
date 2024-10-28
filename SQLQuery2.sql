--Create a new database named "CompanyDB."
CREATE DATABASE CompanyDB
--Create a schema named "Sales" within the "CompanyDB" database.
CREATE SCHEMA Sales 
--Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
CREATE TABLE employees(
employee_id INT DEFAULT(SELECT NEXT VALUE FOR i),
first_name VARCHAR(50),
last_name VARCHAR(50),
salary DECIMAL(10,2)
)
--Note: on employee_id use sequence NOT Identity
CREATE sequence i
AS INT
START WITH 1
INCRMENT BY 1

--Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
ALTER TABLE CompanyDB
ADD HIRE_DATE DATE 

--Select all columns from the "employees" table
SELECT*
FROM Sales.employees

--Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name , last_name
FROM Sales.employees

--Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT first_name + ' '+ last_name 'full name'
FROM Sales.employees

--Show the average salary of all employees
SELECT salary
FROM Sales.employee

--Select employees whose salary is greater than 50000
SELECT salary
FROM Sales.employee
WHERE salary > 50000 

--Retrieve employees hired in the year 2020.
SELECT HIRE_DATE
FROM Sales.employee
WHERE HIRE_DATE IN 2020

--List employees whose last names start with 'S.'
SELECT last_name
FROM Sales.employee
WHERE last_name LIKE 'S'

--Display the top 10 highest-paid employees.
SELECT TOP(10)
FROM Sales.employee
ORDER BY salary DESC

--Find employees with salaries between 40000 and 60000.
SELECT*
FROM Sales.employee
WHERE salary BETWEEN '40000' AND '60000'

--Show employees with names containing the substring 'man.'
SELECT first_name + ' '+ last_name 'full name'
FROM Sales.employee
WHERE full name LIKE '%man'

--Display employees with a NULL value in the "hire_date" column.
SELECT*
FROM Sales.employee
WHERE HIRE_DATE IS NULL

--Select employees with a salary in the set (40000, 45000, 50000).
SELECT*
FROM Sales.employee
WHERE salary = 40000 OR salary = 45000 OR salary = 50000

--Retrieve employees hired between  and '2021-01-01.'
SELECT *
FROM Sales.employee
WHERE HIRE_DATE BETWEEN '2020-01-01' AND '2021-01-01'

--List employees with salaries in descending order.
SELECT *
FROM Sales.employee
ORDER BY salary ASC

--Show the first 5 employees ordered by "last_name" in ascending order.
SELECT TOP(5)
FROM Sales.employee
ORDER BY last_name ASC

--Display employees with a salary greater than 55000 and hired in 2020.
SELECT*
FROM Sales.employee
WHERE salary > 55000 AND HIRE_DATE = 2020

--Select employees whose first name is 'John' or 'Jane.'
SELECT*
FROM Sales.employee
WHERE first_name LIKE 'John' OR first_name LIKE 'Jane'

--List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT*
FROM Sales.employee
WHERE salary <= 55000 AND HIRE_DATE  < '2022-01-01'

--Retrieve employees with a salary greater than the average salary.
SELECT*
FROM Sales.employee
WHERE salary > salary / 2

--Display the 3rd to 7th highest-paid employees
SELECT*
FROM Sales.employee
ORDER BY HIRE_DATE
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY

--List employees hired after '2021-01-01' in alphabetical order.
SELECT*
FROM Sales.employee
WHERE HIRE_DATE < '2021-01-01'
ORDER BY HIRE_DATE ASC


--Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT*
FROM Sales.employee
WHERE salary > 50000 AND last_name NOT LIKE '%A '

--Display employees with a salary that is not NULL
SELECT*
FROM Sales.employee
WHERE salary IS NOT NULL

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT*
FROM Sales.employee
WHERE first_name LIKE '[E,I]' AND  salary > 45000 