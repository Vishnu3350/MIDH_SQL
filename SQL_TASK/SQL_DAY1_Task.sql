/*TASK1: create a database named college_db and make it the active database*/ 
create database college_db;
use college_db;

/*TASK2: Create a table named Student with the following columns*/
create table Student (
	student_id int,
    student_name varchar(50),
    age int,
    city varchar(50)
);

/*TASK3: Insert the following records into the student table*/

insert into Student (student_id, student_name, age, city) values
(101, 'Rahul', 21, 'Hyderabad'),
(102, 'Anjali', 20, 'Chennai'),
(103, 'Ravi', 22, 'Banglore'),
(101, 'Priya', 19, 'Pune'),
(101, 'Kiran', 23, 'Mumbai');
select * from Student;