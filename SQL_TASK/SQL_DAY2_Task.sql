# Task1 - Create a complete employee database.
create database office_db1;
use office_db1;
create table Department
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Department(department_id, department_name) VALUES
(101, 'HR'),
(102, 'Manager'),
(103, 'Development'),
(104, 'Testing'),
(105, 'Automation');
DESC Department;

SELECT * FROM Department;

create table Employee
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    employee_email VARCHAR(50) UNIQUE,
    employee_salary DECIMAL(10,2) DEFAULT 40000,
    employee_age INT CHECK (employee_age >= 18),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
desc Employee;
INSERT INTO Employee VALUES
(1, 'John', 'john@gmail.com', 45000, 25, 101),
(2, 'David', 'david@gmail.com', 50000, 30, 102),
(3, 'Vishnu', 'vishnu@gmail.com', 25000, 23, 103),
(4, 'Praneeth', 'praneeth@gmail.com', 40000, 25, 104),
(5, 'karthi', 'karthi@gmail.com', 18000, 24, 101),
(6, 'Resh', 'resh@gmail.com', 24000, 27, 102),
(7, 'Avi', 'avi@gmail.com', 71000, 29, 103),
(8, 'Tan', 'tan@gmail.com', 80000, 19, 104),
(9, 'Revi', 'revi@gmail.com', 19000, 21, 102),
(10, 'Sai', 'sai@gmail.com', 75000, 35, 104);
select * from Employee;


# Task2 - Using the Employee and Department tables, write queries for the following:
-- Display all employees.
SELECT * FROM Employee;

-- Display only employee names and salaries.
SELECT employee_name, employee_salary FROM Employee;

-- Find employees earning more than ₹50,000.
SELECT * FROM Employee WHERE employee_salary > 50000;

-- Find employees between ages 25 and 30.
SELECT * FROM Employee WHERE employee_age BETWEEN 25 AND 30;

-- Display employees from departments 101 and 103.
SELECT * FROM Employee WHERE department_id IN (101, 103);

-- Display distinct department IDs.
SELECT DISTINCT department_id FROM Employee;

-- Sort employees by salary in descending order.
SELECT * FROM Employee ORDER BY employee_salary DESC;

-- Display the first 5 employees.
SELECT * FROM Employee LIMIT 5;

-- Find employees whose names start with 'J'. 
SELECT * FROM Employee WHERE employee_name LIKE 'J%';

-- Total employees.
SELECT COUNT(*) AS total_employees FROM Employee;

-- Maximum salary.
SELECT MAX(employee_salary) AS maximum_salary FROM Employee;

-- Minimum salary.
SELECT MIN(employee_salary) AS minimum_salary FROM Employee;

-- Average salary.
SELECT AVG(employee_salary) AS average_salary FROM Employee;

-- Count employees department-wise using GROUP BY.
SELECT department_id, COUNT(*) AS employee_count FROM Employee GROUP BY department_id;

-- Display only departments having more than one employee using HAVING.
SELECT department_id, COUNT(*) AS employee_count FROM Employee GROUP BY department_id HAVING COUNT(*) > 1;

-- Display employee name with department name using INNER JOIN.
SELECT e.employee_name, d.department_name FROM Employee e INNER JOIN Department d ON e.department_id = d.department_id;