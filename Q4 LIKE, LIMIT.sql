CREATE TABLE employee (P_id        INT PRIMARY KEY,
F_name  VARCHAR(50),
L_name   VARCHAR(50),
address     VARCHAR(50), contact     VARCHAR(15),
state       VARCHAR(50),
b_salary    INT,
T_allowance INT);

INSERT INTO employee (P_id, F_name, L_name, address, contact, state) VALUES
(1, 'Riya',    'Singh',  'a-20',  '4754111',  'Delhi'),
(2, 'Kuldeep', 'Sharma', 'b-35',  '1564156',  'Mumbai'),
(3, 'Sonali',  'Singh',  'c-27',  '485586',   'Himachal'),
(4, 'Rahul',   'Kumar',  'A2-45', '788145',   'Delhi'),
(5, 'Siya',    'Gupta',  'A2-42', '5045646',  'Mumbai'),
(6, 'Geeta',   'Singh',  'a-21',  '65655646', 'Assam'),
(7, 'Anjali',  'Kumar',  'a-35',  '2162556',  'DELHI');

--Q1 LIKE op?

SELECT * FROM employee WHERE Last_name LIKE 'S%';

SELECT * FROM employee WHERE state LIKE 'D%';
SELECT * FROM employee WHERE First_name LIKE '%a';

--Q2. SELECT the ROWS whose P_id IS BETWEEN 2 AND 7?

SELECT * FROM employee WHERE P_id BETWEEN 2 AND 7;

--Q3.select top 7n ROWS FROM TABLE?

SELECT * FROM employee LIMIT 7;
--Q4.select ROWS whose designation IS java developer?

IDK


