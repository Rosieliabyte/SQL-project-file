CREATE TABLE client_master (Client_no VARCHAR(10) PRIMARY KEY,
    NAME      VARCHAR(50),
    City      VARCHAR(50),
    Pincode   INT,
    State     VARCHAR(50),
    Baldue    INT);
    
 INSERT INTO client_master (Client_no, NAME, City, Pincode, State, Baldue) VALUES
('C00001', 'Ivan Bayross',    'Mumbai',    400054, 'Maharashtra', 15000),
('C00002', 'Mamta muzumdar',  'madras',    780001, 'Tamil Nadu',  0),
('C00003', 'Chhaya Bankar',   'Mumbai',    400057, 'Maharashtra', 5000),
('C00004', 'Ashwini joshi',   'Bangalore', 560001, 'karnataka',   0),
('C00005', 'Hansel colaco',   'Mumbai',    400060, 'Maharashtra', 2000),
('C00006', 'Deepak Sharma',   'Mangalore', 560050, 'Karnataka',   0); 
    
 
 SELECT NAME FROM client_master;
 
  SELECT * FROM client_master;
 SELECT NAME, City, State FROM client_master;
 SELECT * FROM client_master WHERE City = 'Mumbai';
UPDATE client_master SET City = 'Bangalore' WHERE Client_no = 'C00005';
UPDATE client_master SET Baldue = 1000 WHERE Client_no = 'C00001';

DELETE FROM client_master WHERE State = 'Tamil Nadu';
DROP TABLE client_master;