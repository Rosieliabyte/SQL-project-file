CREATE TABLE orders ( P_id  INT NOT NULL,Product_name  VARCHAR(255), 
Unit_price    NUMERIC(18,0),
Unit_in_stock NUMERIC(18,0),
Unit_in_order NUMERIC(18,0));

INSERT INTO orders (P_id, Product_name, Unit_price, Unit_in_stock, Unit_in_order) VALUES
(1,  'Computer',     25000, 15, 12),
(2,  'Hard disk',    3500,  10, 9),
(3,  'Pen drive',    500,   25, 23),
(4,  'Mouse',        200,   30, 30),
(5,  'Sheets',       550,   50, 48),
(6,  't-shirts',     650,   17, 16),
(7,  'Jeans',        850,   35, 32),
(8,  'Suits',        1250,  43, 41),
(9,  'Pants',        550,   50, 49),
(10, 'Mother board', 520,   16, 70),
(11, 'Pencil',       25,    45, 73),
(12, 'Pen',          15,    35, 41),
(13, 'Book',         250,   23, 21),
(14, 'Eraser',       10,    15, 11),
(15, 'notebook',     275,   10, 8);

--Q1. Display product NAME whose unit price > 200 AND unit IN stock?

SELECT Product_name FROM orders WHERE Unit_price > 200 AND Unit_in_stock > 20;

--Q2.p_name whose unit_order>20?
SELECT Product_name FROM orders WHERE Unit_in_order > 20;

--Q3. SUM OF unit_price?

SELECT SUM(Unit_price) FROM orders;

--Q4.max VALUE FROM unit_in_stock?
SELECT MAX(Unit_in_stock) FROM orders;

--Q5.count the COLUMN unit_price?
SELECT COUNT(Unit_price) FROM orders;

--Q6.change TO UPPER OR LOWER CASE fpr product?
SELECT UPPER(Product_name) FROM orders;
SELECT LOWER(Product_name) FROM orders;

--Q7. COUNT the LENGTH pf p_name?
SELECT Product_name, LENGTH(Product_name) FROM orders;




