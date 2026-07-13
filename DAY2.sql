CREATE DATABASE office_db;
USE office_db;

CREATE TABLE dept
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO dept (dept_id, dept_name) VALUES
(101, 'Testing'),
(102, 'OPT'),
(103, 'IT'),
(104, 'NON-IT');
DESC Dept;

SELECT * FROM dept;
show tables;
CREATE TABLE employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    emp_email VARCHAR(50) UNIQUE,
    emp_salary DECIMAL(10,2) DEFAULT 40000,
    emp_age INT CHECK (emp_age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);

DESC employee;
INSERT INTO employee VALUES
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

SELECT * FROM employee;

-- Primary key 
insert into employee values
(1, 'John', 'john@gmail.com', 45000, 25, 101);
select * from employee;

# UNIQUE EXAMPLE

INSERT INTO employee
VALUES
(11, 'Kishore', 'kishore@gmail.com', 50000, 30, 102);
SELECT * FROM employee;
DESC employee;

#DEFAULT EXAMPLE


INSERT INTO employee
(emp_id, emp_name, email_, age, dept_id)
VALUES
(10,'Sai','sai@gmail.com',35,104);

SELECT * FROM employee;
 DESC employee;


#FOREIGN KEY EXAMPLE

INSERT INTO employee
VALUES
(12,'Sumanth','sumanth@gmail.com',40000,26,104);

SELECT * FROM employee;

-- where 
select * from employee where dept_id=103;
select * from employee where emp_name = 'vishnu';

-- distinct
select distinct dept_id from employee;

-- order by
select * from employee order by emp_salary desc;
select * from employee order by emp_name;

-- limit
select * from employee limit 3;
select * from employee limit 5;

-- between
select * from employee where emp_salary between 35000 and 55000;
select * from employee where emp_age between 25 and 30;

-- in
select * from employee where dept_id in (101, 102);

-- not in
select * from employee where dept_id not in (101, 104);

-- is null
select * from employee where emp_email is null;

-- is not null
select * from employee where emp_email is not null;

-- like
select * from employee where emp_name like '%a';
select * from employee where emp_name like 'a%';
select * from employee where emp_name like '%an%';
select * from employee where emp_name like '_a%';


-- ===========================================================
		-- AGGREGRATE FUNCTIONS
-- ===========================================================

select count(*) from employee;
select max(emp_salary) from employee;
select min(emp_salary) from employee;
select sum(emp_salary) from employee;
select avg(emp_salary) from employee;

-- group by -> 
select dept_id, count(*) from employee group by dept_id;

-- having
select dept_id, count(*) from employee group by dept_id having count(*) > 2;

-- alias
select emp_name as e_name, emp_salary as e_salary from employee;
select e.emp_name, e.emp_salary from employee e;





-- group by 
select dept_id, avg(emp_salary) from employee group by dept_id; 

select dept_id, min(emp_salary) from employee group by dept_id;


-- JOINTS
# Inner join
-- select col_name from table_1 inner join table_2 on table1.col_name = table2.col_name;

select e.emp_name, d.dept_name from dept as d inner join employee as e on d.dept_id = e.dept_id;

# left join
-- select col.name from table_1 left join table_2 on table1.col_name = table2.col_name;


