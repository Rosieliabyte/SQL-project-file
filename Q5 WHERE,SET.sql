CREATE TABLE student_record (Roll_no      INT PRIMARY KEY, Student_Name VARCHAR(50),
English      INT,
Maths        INT, Total        INT,
Average      DECIMAL(5,1));

INSERT INTO student_record (Roll_no, Student_Name, English, Maths) VALUES
(1,  'Rohan',   56, 65),
(2,  'Sohan',   75, 74),
(3,  'Karan',   48, 49),
(4,  'Sahil',   39, 25),
(5,  'Sunil',   87, 67),
(6,  'Deepak',  59, 74),
(7,  'Priya',   65, 89),
(8,  'Riya',    81, 80),
(9,  'Savita',  52, 63),
(10, 'Kiran',   60, 42),
(11, 'Deepali', 35, 56),
(12, 'Vicky',   50, 26),
(13, 'Lucky',   86, 95),
(14, 'Harsh',   74, 45),
(15, 'Hari',    40, 48),
(16, 'Sonia',   52, 78),
(17, 'Pooja',   46, 54),
(18, 'Sonali',  63, 98),
(19, 'Sumit',   53, 61),
(20, 'Komal',   82, 69);

--1 .SELECT * FROM student_record WHERE Roll_no IN (5, 10, 15);
--2. SELECT Student_Name, English, Maths FROM student_record
WHERE Student_Name IN ('Sahil', 'Savita', 'Sunil');

--3. SELECT * FROM student_record WHERE English > 50;

--4. SELECT * FROM student_record WHERE Maths > 20 AND Maths < 80;

--5. UPDATE student_record SET Total = English + Maths;
--6. UPDATE student_record SET Average = Total / 2;





