CREATE TABLE employee_name (EMP_ID  INT PRIMARY KEY,FIRST_NAME VARCHAR(225), LAST_NAME VARCHAR(225),
CITY VARCHAR(225));

INSERT INTO employee_name (EMP_ID, FIRST_NAME, LAST_NAME, CITY) VALUES
(1001, 'ROHAN',   'SINGH',  'JANAK PURI'),
(1002, 'KARAN',   'GUPTA',  'VIKAS PURI'),
(1003, 'RIYA',    'SHARMA', 'VIKAS PURI'),
(1004, 'MANISH',  'KUMAR',  'RAJOURI GARDEN'),
(1005, 'MOHIT',   'SINGH',  'MOTI NAGAR'),
(1006, 'SANDEEP', 'KAUR',   'JANAK PURI'),
(1007, 'SUNIL',   'KUMAR',  'MOTI NAGAR'),
(1008, 'KIRAN',   'BISTT',  'MOTI NAGAR'),
(1009, 'SAHIL',   'KUMAR',  'KIRTI NAGAR'),
(1010, 'ROHIT',   'SINGH',  'RAJA GARDEN'),
(1011, 'SOHAN',   'SONI',   'MOTI NAGAR'),
(1012, 'MANDEEP', 'SHARMA', 'RAJOURI GARDEN'),
(1013, 'DEEPAK',  'KUMAR',  'VIKAS PURI'),
(1014, 'LALITA',  'SHARMA', 'RAJOURI GARDEN');

--1.  SELECT * FROM employee_name;
--2. SELECT emp_id,first_name,last_name FROM employee_name;
--3. SELECT * FROM employee_name WHERE emp_id = 1001;
--4. SELECT first_name,last_name,city FROM employee_name WHERE first_name IN ('riya','mohit','sunil');
--5. SELECT * FROM employee_name WHERE LAST_NAME = 'sharma';
--6. SELECT * FROM employee_name WHERE CITY IN ('janak puri', 'moti nagar', 'vikas puri');



