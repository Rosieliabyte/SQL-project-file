CREATE TABLE person (P_id       INT PRIMARY KEY,
Last_name  VARCHAR(50),
First_name VARCHAR(50),
address    VARCHAR(100),
City       VARCHAR(50));

INSERT INTO person (P_id, Last_name, First_name, address, City) VALUES
(1, 'Sharma', 'Deepak', '20-tilak nagar',  'Delhi'),
(2, 'Kumar',  'Rohan',  '35-andheri west', 'Mumbai'),
(3, 'Singh',  'Gagan',  '27-vikas puri',   'Delhi'),
(4, 'Sharma', 'Ritu',   '45-una',          'Hp'),
(5, 'Gupta',  'renu',   '50-janak puri',   'Delhi'),
(6, 'kumari', 'riya',   '62-andheri west', 'Mumbai');

--Q1.Display LAST NAME WHERE city IS del?
SELECT last_name FROM person WHERE city='Delhi';

--Q2. LAST NAME AND address WHERE city IS 'e-hi'?

SELECT last_name,address FROM person WHERE City LIKE '%e_hi';

--Q3.list FIRST NAME BY IN op. whose LAST NAME IS sharma AND kumar?

SELECT First_name FROM person WHERE Last_name IN ('Sharma', 'Kumar');

--Q4.check 1st NAME AND LAST NAME BY OR,AND operator whose LAST NAME IS singh AND kumar?

SELECT First_name, Last_name FROM person
WHERE Last_name = 'Singh' OR Last_name = 'kumar';

SELECT First_name, Last_name FROM person
WHERE Last_name = 'Singh' AND City = 'Delhi';