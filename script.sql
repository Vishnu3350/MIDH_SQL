create database company_db;
show databases;
use company_db;
create table department (
dept_id int primary key, dept_name varchar(50)
);
desc department;
insert into department values(101, 'Finance'), (102, 'IT'), (103, 'Security');
