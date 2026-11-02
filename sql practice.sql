CREATE TABLE sales ( NAME VARCHAR(50),items VARCHAR(50),qty INT,rate INT,total INT);

INSERT INTO sales (NAME, Items, Qty, Rate) VALUES
('Sunil',   'Shirts',   45, 450),
('Sohan',   't-shirts', 30, 650),
('Vicky',   'Jeans',    25, 750),
('vikas',   'Shirts',   15, 850),
('Gagan',   'Jeans',    10, 1100),
('Sandeep', 'Shirts',   15, 1200),
('kapil',   'Jeans',    20, 950),
('Geeta',   't-shirts', 25, 750),
('Riya',    'Shirts',   50, 650),
('siya',    'jeans',    45, 450);

SELECT * FROM sales;   (--select ALL ROWS FROM the above TABLE)

--calculate the total COLUMN;

UPDATE sales SET total = qty*rate;
SELECT qty*rate AS total FROM sales;

--check records WITH LIKE operator;

-- Names starting with S
SELECT * FROM sales WHERE NAME LIKE 'S%';

-- Names ending with a
SELECT * FROM sales WHERE NAME LIKE '%a';


-- Names with "i" as the second letter
SELECT * FROM sales WHERE NAME LIKE '_i%';


-- Items containing "shirt" (matches both Shirts and t-shirts)
SELECT * FROM sales WHERE Items LIKE '%shirt%';



