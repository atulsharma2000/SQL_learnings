--to display all the databases
SHOW DATABASES;

--to remove/delete the database
DROP DATABASE dbda_db; 

--to create a new database
CRETAE DATABASE dbda_db;

--to start using the database
USE dbda_db;

--to display all the tables from the selected database
SHOW TABLES;

--cretae a new table demo
CREATE TABLE demo(id int ,name char(10));
CREATE TABLE demo2(c1 int, c2 int);

-- to add the data in the table demo
INSERT INTO demo VALUES(1,'Anil');

-- to check the data from the demo table
SELECT * FROM demo;
SELECT * FROM demo2;

-- to delete the table
DROP TABLE demo2;

--create student table with rollno,name and marks
CREATE TABLE student(
    rollno INT, 
    name VARCHAR(10),
    marks DECIMAL(5,2)
    );
-- add the records in the table
-- 1, Anil, 50
-- 2, Mukesh ,60
-- 3, Ramesh , 70
-- 4, Suresh , 80

INSERT INTO student VALUES(1,'Anil',50);
INSERT INTO student VALUES(2,'Mukesh',60);

INSERT INTO student(rollno, name, marks) VALUES(3,'Ramesh',70);

INSERT INTO student VALUES(4,70,'suresh');
-- error
-- pass the values in the same sequence as the columns are declared

INSERT INTO student(rollno,marks,name) VALUES(4,70,'suresh');
-- to pass the values in any sequence specify the col names 
-- after the table name in the INSERT query

-- 5,Ram
INSERT INTO student VALUES(5,'Ram');
--error

INSERT INTO student(rollno,name) VALUES(5,'Ram');
-- ok

-- sham,80
INSERT INTO student(name,marks) VALUES('Sham',80);

-- display all the students
SELECT * FROM student;

-- create a table temp with cols c1 char(4), c2 varchar(4),c3 TEXT(4)
CREATE TABLE temp(
    c1 CHAR(4),
    c2 VARCHAR(4),
    c3 TEXT(4)
);

INSERT INTO temp VALUES('a','a','a');
INSERT INTO temp VALUES('ab','ab','ab');
INSERT INTO temp VALUES('abc','abc','abc');
INSERT INTO temp VALUES('abcd','abcd','abcd');

INSERT INTO temp VALUES('abcde','abcde','abcde');
--error - Data too long for column 'c1' at row 1

INSERT INTO temp VALUES('abcd','abcde','abcde');
-- error - Data too long for column 'c2' at row 1

INSERT INTO temp VALUES('abcd','abcd','abcde');


CREATE DATABASE classwork_db;
USE classwork_db;
SOURCE <path to the classwork_db.sql file>


-- Projections
SELECT * FROM emp;

SELECT empno,ename,job,mgr,hire,sal,comm,deptno FROM emp;

SELECT empno,ename,sal FROM emp;

SELECT sal, hire, ename, mgr, empno FROM emp;

-- display empname and sal of all employees
SELECT ename,sal FROM emp;

-- Computed Columns 
-- display emp name, sal and his DA (50% of the salary)
SELECT ename,sal, sal*0.5 FROM emp;

-- Alias
SELECT ename,sal, sal*0.5 AS da FROM emp; --OK
SELECT ename,sal, sal*0.5 da FROM emp; --OK

-- display ename,sal,da and total salary (sal + da) of all the employees

SELECT ename,sal,sal*0.5 AS da,sal + da FROM emp;
-- NOT OK

SELECT ename,sal,sal*0.5 AS da,sal + sal*0.5 FROM emp;

SELECT ename,sal,sal*0.5 AS da,sal + sal*0.5 AS total_salary FROM emp;

SELECT ename,sal,sal*0.5 AS da,sal + sal*0.5 AS `total salary` FROM emp;

CASE 
WHEN 10 THEN 'ADMINISTARTION'
END
-- 10 - Administration
-- 20 - Testing
-- 30 - Development

SELECT ename, deptno FROM emp;

SELECT ename, deptno, CASE
WHEN deptno=10 THEN 'ADMINISTRATION'
END
FROM emp;

SELECT ename, deptno, CASE
WHEN deptno=10 THEN 'ADMINISTRATION'
END AS deptname
FROM emp;

SELECT ename, deptno, CASE
WHEN deptno=10 THEN 'ADMINISTRATION'
WHEN deptno=20 THEN 'TESTING'
WHEN deptno=30 THEN 'DEVELOPMENT'
END AS deptname
FROM emp;

-- display ename from emp;
SELECT ename FROM emp;

-- display sal from emp;
SELECT sal FROM emp;

-- display job from emp;
SELECT job FROM emp;

-- display all the unique jobs from the emp;
SELECT DISTINCT job FROM emp;

-- display unique deptno from emp;
SELECT DISTINCT deptno FROM emp;

-- display deptno and job from emp;
SELECT deptno,job FROM emp;

-- display deptno and their unique jobs

SELECT deptno,DISTINCT job FROM emp;
--error

SELECT DISTINCT deptno, job FROM emp;