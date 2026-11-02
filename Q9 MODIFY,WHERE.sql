CREATE TABLE product_master (product_no  VARCHAR(50),DESCRIPTION VARCHAR(50),
profit_percent DECIMAL(4,2), unit_measure VARCHAR(50),QTY INT, recorderlvp INT,
sell_price INT, cost_price DECIMAL(8,2));

INSERT INTO product_master (product_no,DESCRIPTION,profit_percent,unit_measure,QTY,
recorderlvp,sell_price,cost_price) VALUES 
('P00001', 'T-shirts',     5,   'Pieces', 200, 50, 350, 250),
('P00002', 'Shirts',       6,   'Pieces', 150, 50, 500, 350),
('P00034', 'Cotton jeans', 5,   'Pieces', 100, 2,  600, 450),
('P00045', 'Jeans',        2,   'Pieces', 100, 20, 750, 500),
('P00022', 'Trousers',     2.5, 'Pieces', 150, 50, 850, 550),
('P00012', 'Pull-over',    4,   'Pieces', 80,  30, 700, 450),
('P00007', 'Denim shirts', 5,   'Pieces', 100, 40, 350, 250);

--3d SELECT DESCRIPTION FROM product_master;
--4c. UPDATE product_master SET cost_price = 1000 WHERE product_no = 'P00001';
--4i. ALTER TABLE product_master MODIFY sell_price DECIMAL(10,2);
--4f. DELETE FROM product_master WHERE QTY = 100;