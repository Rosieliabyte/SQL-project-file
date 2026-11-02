CREATE TABLE salesman_master (salesman_no VARCHAR(50),NAME VARCHAR(50), address1 VARCHAR(50),
address2 VARCHAR(50),city VARCHAR(50), pincode INT,state VARCHAR(50),sal_amt INT, target INT,
ytd_sales INT, remarks VARCHAR(50));

INSERT INTO salesman_master
(Salesman_no, NAME, Address1, Address2, City, Pincode, State, Sal_amt, Target, Ytd_sales, Remarks) VALUES
('S00001', 'Aman',   'A\\14', 'WORLI',   'MUMBAI', 400002, 'MAHARASTRA', 3000, 100, 50,  'GOOD'),
('S00002', 'Omkar',  '65',    'NARIMAN', 'MUMBAI', 400001, 'MAHARASTRA', 3000, 200, 100, 'GOOD'),
('S00003', 'Raj',    'P-5',   'BANDRA',  'MUMBAI', 400032, 'MAHARASTRA', 3000, 200, 100, 'GOOD'),
('S00004', 'Ashish', 'A\\5',  'JUHU',    'MUMBAI', 400044, 'MAHARASTRA', NULL, NULL, NULL, NULL);

--3e. SELECT NAME FROM salesman_master WHERE sal_amt= 3000;
--4d. UPDATE salesman_master SET city ='pune' WHERE salesman_no = 'S00001';
--4E. DELETE FROM salesman_master WHERE sal_amt= 3500;