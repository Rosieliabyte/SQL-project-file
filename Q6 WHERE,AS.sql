CREATE TABLE client_complaints (Client_No    VARCHAR(10) PRIMARY KEY,
Product_Name VARCHAR(50),
Complaint_No INT,
Price        INT);

INSERT INTO client_complaints (Client_No, Product_Name, Complaint_No, Price) VALUES
('C001', 'Mouse',       230, 500),
('C002', 'Pen Drive',   416, 750),
('C003', 'C.P.U',       523, 2500),
('C004', 'Computer',    167, 18500),
('C005', 'Hard Disk',   20,  4500),
('C006', 'Motherboard', 25,  6500),
('C007', 'RAM',         30,  650),
('C008', 'Shirts',      45,  650),
('C009', 'T-Shirts',    60,  950),
('C010', 'Suits',       65,  850),
('C011', 'Sarees',      168, 800),
('C012', 'Pants',       320, 650),
('C013', 'Jeans',       350, 950),
('C014', 'Laptop',      415, 19500),
('C015', 'Desktop',     215, 13500);

--1. SELECT * FROM client_complaints WHERE Client_No IN ('C002', 'C009', 'C013');
--2.
SELECT * FROM client_complaints WHERE Complaint_No IN (230, 25, 45);
--3. SELECT * FROM client_complaints WHERE Price > 3000 AND Price < 10000;
--4.
SELECT * FROM client_complaints
WHERE Product_Name IN ('Pen Drive', 'Shirts', 'T-Shirts');

--5.

SELECT Client_No, Product_Name, Price, Complaint_No,
       Price - Complaint_No AS diff
FROM client_complaints;




