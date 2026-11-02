CREATE TABLE emp_basic (P_ID  INT PRIMARY KEY, Last_name  VARCHAR(50),
First_name VARCHAR(50),Address VARCHAR(50), City VARCHAR(50));

CREATE TABLE emp_info (P_ID INT PRIMARY KEY,Last_name VARCHAR(50),Address VARCHAR(50),
Emp_contact INT,City VARCHAR(50));

INSERT INTO emp_basic (P_ID, Last_name, First_name, Address, City) VALUES
(1,  'SINGH',   'ROHAN',    'A-20',  'MOHAN GARDEN'),
(2,  'GUPTA',   'KARAN',    'B-35',  'TILAK NAGAR'),
(3,  'SHARMA',  'RIYA',     'A-25',  'VIKASPURI'),
(4,  'KUMAR',   'MANISH',   'C-51',  'MOTI NAGAR'),
(5,  'KUMARI',  'SAKSHI',   'A2-42', 'JANAK PURI'),
(6,  'KUMAR',   'MONTU',    'A-21',  'DWARKA'),
(7,  'THAKUR',  'DIMPI',    'A-32',  'UTTAM NAGAR'),
(8,  'MADAAN',  'PRAVEEN',  'C-63',  'VIKASPURI'),
(9,  'KASHYAP', 'ADITYA',   'A2-9',  'TILKA NAGAR'),
(10, 'SHARMA',  'HIMANI',   'C2-98', 'MOTI NAGAR'),
(11, 'GUPTA',   'SHIVANGI', 'C-43',  'VIKAS PURI');

INSERT INTO emp_info (P_ID, Last_name, Address, Emp_contact, City) VALUES
(1,  'SINGH',  'A-20',  4599,    'MOHAN GARDEN'),
(2,  'GUPTA',  'B-35',  123654,  'TILAK NAGAR'),
(3,  'SHARMA', 'A-25',  NULL,    'VIKASPURI'),
(4,  'KUMAR',  'C-51',  65544,   'MOTI NAGAR'),
(5,  'SINGH',  'A2-42', 12345,   'JANAK PURI'),
(6,  'KAUR',   'A-21',  2364569, 'DWARKA'),
(7,  'KUMAR',  'A-32',  NULL,    'UTTAM NAGAR'),
(8,  'BISTT',  'C-63',  NULL,    'VIKASPURI'),
(9,  'KUMAR',  'A2-9',  123987,  'TILKA NAGAR'),
(10, 'SINGH',  'C2-98', 986542,  'MOTI NAGAR'),
(11, 'SONI',   'C-43',  986542,  'VIKAS PURI');


--1. SELECT * FROM emp_basic WHERE p_id = 7;
--1b. SELECT* FROM emp_info WHERE emp_contact IS NULL;

--5. CREATE a result SET USING JOIN,PRIMARY,AND FOREIGN KEY?

SELECT P_ID, First_name, Last_name, Address, Emp_contact,City
FROM emp_basic INNER JOIN emp_info ON b.P_ID = i.P_ID;

--4. apply FOREIGN KEY IN multiple COLUMNS, empid AND city?

ALTER TABLE emp_basic ADD UNIQUE (P_ID, City);

ALTER TABLE emp_info ADD CONSTRAINT emp_city FOREIGN KEY (P_ID, City) 
REFERENCES emp_basic(P_ID, City);

UPDATE emp_info SET City = 'ROHINI' WHERE P_ID = 5;





