CREATE TABLE employee_details (ECode VARCHAR(10) PRIMARY KEY, Ename VARCHAR(50),
Dept  VARCHAR(50),
City  VARCHAR(50),
Basic INT,
DA    INT);

INSERT INTO employee_details (ECode, Ename, Dept, City, Basic, DA) VALUES
('E001', 'Rohan',   'Sales',      'New Delhi', 20000, 2000),
('E002', 'Sohan',   'Computer',   'New Delhi', 22500, 3000),
('E003', 'Karan',   'Purchase',   'New Delhi', 25000, 3500),
('E004', 'Sahil',   'Sales',      'New Delhi', 25000, 3000),
('E005', 'Sunil',   'Accountant', 'New Delhi', 30000, 6000),
('E006', 'Deepak',  'Sales',      'New Delhi', 26500, 3100),
('E007', 'Priya',   'Purchase',   'New Delhi', 21000, 2700),
('E008', 'Riya',    'Computer',   'New Delhi', 28000, 3950),
('E009', 'Savita',  'Accountant', 'New Delhi', 35750, 5600),
('E010', 'Kiran',   'Sales',      'New Delhi', 31000, 4850),
('E011', 'Deepali', 'Purchase',   'New Delhi', 41000, 7200),
('E012', 'Vicky',   'Sales',      'New Delhi', 42500, 7600),
('E013', 'Lucky',   'Purchase',   'New Delhi', 39000, 6400),
('E014', 'Harsh',   'Accountant', 'New Delhi', 48500, 8400),
('E015', 'Hari',    'Sales',      'New Delhi', 26500, 3150),
('E016', 'Sonia',   'Purchase',   'New Delhi', 31500, 5550),
('E017', 'Pooja',   'Accountant', 'New Delhi', 44500, 8700),
('E018', 'Sonali',  'Sales',      'New Delhi', 27000, 2400),
('E019', 'Sumit',   'Computer',   'New Delhi', 37500, 4700),
('E020', 'Komal',   'Computer',   'New Delhi', 41500, 6700);

--1. SELECT Ename, Dept, Basic FROM employee_details WHERE ECode IN ('E001', 'E006');
--2. 
SELECT * FROM employee_details WHERE Dept IN ('Computer', 'Sales');

--3. 
SELECT ECode, Ename, Basic, DA, Basic + DA AS Total_Salary FROM employee_details;

--4. 
SELECT ECode, Ename, Basic, Basic * 0.75 AS HRA FROM employee_details;

--5. SELECT ECode, Ename, Basic + DA + Basic * 0.75 AS Gross FROM employee_details;

---AVG,MIN,MAX(7 QUES)

--1. FIND HIGHEST BASIC SAL?

SELECT MAX(Basic) FROM employee_details;

--2.FIND LOWEST BASIC SAL?

SELECT MIN(Basic) FROM employee_details;

--3. FIND AVG BASIC SAL OF ALL EMPLOYEES?

SELECT AVG(BASIC)FROM EMPLOYEE_DETAILS;

--4. FIND THE MIN & MAX DA IN ONE QUERY

SELECT MIN(DA),MAX(DA) FROM employee_details;

---GROUP BY (HAVINGCLAUSE)

--5. SHOW DEPT WISE AVG BASIC SAL, BUT ONLY DEPT WHOSE AVG IS >30000?

SELECT Dept, AVG(basic) AS avg_basic FROM employee_details
GROUP BY dept HAVING AVG(basic) > 30000;

--6. COUNT the employees IN EACH dept, but SHOW ONLY dept HAVING more THAN 4 employees?

SELECT dept,COUNT(*) AS ttl_emp FROM employee_details
GROUP BY dept HAVING COUNT(*) >4;


--7. SHOW the department wise lowest basic sal, but ONLY dept whose LOWER IS LESS THAN 25000?


SELECT dept,MIN(basic) AS low_sal FROM employee_details
GROUP BY dept HAVING MIN(basic) < 25000;












































