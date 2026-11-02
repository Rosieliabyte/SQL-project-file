CREATE TABLE person2 (p_id INT PRIMARY KEY, NAME VARCHAR(30),address VARCHAR(30));

CREATE TABLE payment (payment_id INT PRIMARY KEY, p_id INT,amount INT);

INSERT INTO person2 (p_id, NAME, address) VALUES
(1, 'Komal', 'Palam'),
(2, 'Ria',   'Rajpur'),
(3, 'Sonu',  'Southex'),
(4, 'Sonia', 'Guwahati'),
(5, 'Isha',  'Moti Nagar');

INSERT INTO payment (payment_id, p_id, amount) VALUES
(101, 1,    500),
(102, 1,    300),
(103, 2,    700),
(104, 3,    200),
(105, NULL, 400),
(106, NULL, 900);


--2. SELECT matched DATA frm BOTH the TABLES(INNER JOIN)

SELECT person2.p_id, person2.name, payment.payment_id, payment.amount
FROM person2 INNER JOIN payment ON person2.p_id = payment.p_id;

--3.select matched DATA AND ALL DATA frm LEFT TABLE

SELECT person2.p_id, person2.name, payment.payment_id, payment.amount
FROM person2 LEFT JOIN payment ON person2.p_id = payment.p_id;

--4.matched+ ALL frm RIGHT TABLE 

SELECT person2.p_id, person2.name, payment.payment_id, payment.amount
FROM person2
RIGHT JOIN payment ON person2.p_id = payment.p_id;


--5. CREATE COLUMN priya_id AS F KEY?


--6.create COLUMN n address COLUMN TO be UNIQUE?

ALTER TABLE person2 ADD COLUMN phone_no INT;

ALTER TABLE person2 ADD UNIQUE(phone_no);
ALTER TABLE person2 ADD UNIQUE (address);

UPDATE person2 SET phone_no = '9807679956' WHERE p_id = 1;

--7. apply NOT NULL, DEFAULT, UNIQUE?

ALTER TABLE person2 MODIFY NAME VARCHAR(50) NOT NULL;
ALTER TABLE person2 ADD COLUMN city VARCHAR(50) DEFAULT 'del';
ALTER TABLE person2 ADD UNIQUE (address);

--1. SELECT ALL DATA frm LEFT n RIGHT TABLE? (UNION)

SELECT person2.p_id, person2.name,payment.payment_id, payment.amount
FROM person2 LEFT JOIN payment ON person2.p_id = payment.p_id
UNION
SELECT person2.p_id,person2.name, payment.payment_id, payment.amount
FROM person2 
RIGHT JOIN payment ON person2.p_id = payment.p_id;















