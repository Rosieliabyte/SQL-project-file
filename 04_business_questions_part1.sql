-- 04_business_questions_part1.sql
-- Part 1: quick data checks + first 4 business questions.
-- Run ONE query at a time in SQLyog (select it, then press F9).

USE inventory_db;

-- ================= QUICK CHECKS (the data was already cleaned in Python) =================

-- Check 1: any repeated day + store + product? (expected: no rows come back)
SELECT record_date, store_id, product_id, COUNT(*) AS times_repeated
FROM daily_inventory_sales
GROUP BY record_date, store_id, product_id
HAVING COUNT(*) > 1;

-- Check 2: any negative units or negative stock? (expected: 0)
SELECT COUNT(*) AS bad_rows
FROM daily_inventory_sales
WHERE units_sold < 0 OR inventory_level < 0;

-- Check 3: any empty (NULL) values in the main columns? (expected: 0)
SELECT COUNT(*) AS rows_with_blanks
FROM daily_inventory_sales
WHERE units_sold IS NULL OR price IS NULL OR inventory_level IS NULL;

-- ================= Q1: Total units sold and total sales value =================
-- Why: the basic size of the business. Every other number is compared with this.
SELECT SUM(units_sold)  AS total_units_sold,
       SUM(sales_value) AS total_sales_value
FROM daily_inventory_sales;

-- Q1 by year
SELECT YEAR(record_date) AS sales_year,
       SUM(units_sold)   AS total_units_sold,
       SUM(sales_value)  AS total_sales_value
FROM daily_inventory_sales
GROUP BY YEAR(record_date)
ORDER BY sales_year;

-- ================= Q2: Top 5 and bottom 5 products by units sold =================
-- Why: shows which products the business depends on most.
-- Top 5
SELECT product_id, SUM(units_sold) AS total_units_sold
FROM daily_inventory_sales
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 5;

-- Bottom 5 (same query, but ASC = smallest first)
SELECT product_id, SUM(units_sold) AS total_units_sold
FROM daily_inventory_sales
GROUP BY product_id
ORDER BY total_units_sold ASC
LIMIT 5;

-- ================= Q3: Which store has the highest sales? =================
-- Why: tells the manager which store brings in the most money.
SELECT store_id,
       SUM(units_sold)  AS total_units_sold,
       SUM(sales_value) AS total_sales_value
FROM daily_inventory_sales
GROUP BY store_id
ORDER BY total_sales_value DESC;

-- ================= Q4: Monthly sales trend =================
-- Why: shows whether demand goes up or down over time.
SELECT sales_month,
       SUM(units_sold)  AS total_units_sold,
       SUM(sales_value) AS total_sales_value
FROM daily_inventory_sales
GROUP BY sales_month
ORDER BY sales_month;
