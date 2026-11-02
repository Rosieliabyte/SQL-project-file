/* =====================================================================
   INVENTORY OPTIMIZATION - BUSINESS QUESTIONS (run AFTER the 3 views exist)
   Works in MySQL 8 (SQLyog). In SQLyog: select ONE query, press F9.
   Each question = the question a CFO / COO would ask + the query + the "so what".
   ===================================================================== */
USE inventory_management;      -- change to your database name if different

/* ---------------------------------------------------------------------
   Q1. EXECUTIVE SNAPSHOT: how big is the inventory and how much is idle?
   So what: one headline number for the dashboard's KPI cards.
   --------------------------------------------------------------------- */
SELECT COUNT(*)                                                          AS total_products,
       ROUND(SUM(stock_value), 0)                                        AS total_stock_value,
       ROUND(SUM(CASE WHEN stock_status IN ('Dead Stock','Overstocked')
                      THEN stock_value ELSE 0 END), 0)                   AS idle_stock_value,
       ROUND(100.0 * SUM(CASE WHEN stock_status IN ('Dead Stock','Overstocked')
                      THEN stock_value ELSE 0 END) / SUM(stock_value), 1) AS idle_pct_of_stock
FROM v_stock_health;

/* ---------------------------------------------------------------------
   Q2. WORKING CAPITAL: how much money sits in each stock-health bucket?
   So what: shows where cash is trapped vs where stock is healthy.
   --------------------------------------------------------------------- */
SELECT stock_status,
       COUNT(*)                                                   AS products,
       ROUND(SUM(stock_value), 0)                                 AS stock_value,
       ROUND(100.0 * SUM(stock_value) / SUM(SUM(stock_value)) OVER (), 1) AS pct_of_total_value
FROM v_stock_health
GROUP BY stock_status
ORDER BY stock_value DESC;

/* ---------------------------------------------------------------------
   Q3. CASH RELEASE OPPORTUNITY: if we cut every overstocked product down to
   180 days of cover, how much cash is freed? (and dead stock = all of it)
   So what: converts analysis into a rupee/dollar recommendation.
   --------------------------------------------------------------------- */
SELECT CategoryName,
       SUM(CASE WHEN stock_status = 'Dead Stock' THEN 1 ELSE 0 END)           AS dead_products,
       ROUND(SUM(CASE WHEN stock_status = 'Dead Stock' THEN stock_value ELSE 0 END), 0) AS dead_stock_value,
       ROUND(SUM(CASE WHEN stock_status = 'Overstocked'
                      THEN (current_stock - avg_daily_demand * 180) * stock_value / NULLIF(current_stock,0)
                      ELSE 0 END), 0)                                          AS excess_over_180_days_value
FROM v_stock_health
GROUP BY CategoryName
ORDER BY dead_stock_value DESC;

/* ---------------------------------------------------------------------
   Q4. PARETO MISMATCH: do our best products hold the stock, or do the worst?
   So what: classic consulting insight - capital should follow revenue.
   --------------------------------------------------------------------- */
SELECT COALESCE(a.abc_class, 'Z - No sales (12 mo)')              AS abc_class,
       COUNT(*)                                                    AS products,
       ROUND(SUM(h.revenue), 0)                                    AS revenue,
       ROUND(SUM(h.stock_value), 0)                                AS stock_value,
       ROUND(100.0 * SUM(h.stock_value) / SUM(SUM(h.stock_value)) OVER (), 1) AS pct_of_stock_value
FROM v_stock_health h
LEFT JOIN v_abc_analysis a ON a.ProductName = h.ProductName
GROUP BY COALESCE(a.abc_class, 'Z - No sales (12 mo)')
ORDER BY abc_class;

/* ---------------------------------------------------------------------
   Q5. STOCKOUT RISK + PURCHASE BUDGET: what must be ordered now and what will it cost?
   So what: a ready-to-approve purchase list, ranked by money at stake.
   --------------------------------------------------------------------- */
SELECT ProductName, CategoryName, Supplier, current_stock, reorder_point,
       days_of_cover, suggested_order_qty,
       ROUND(suggested_order_qty * stock_value / NULLIF(current_stock, 0), 0) AS estimated_order_cost
FROM v_stock_health
WHERE stock_status = 'Reorder Now'
ORDER BY estimated_order_cost DESC;

/* ---------------------------------------------------------------------
   Q6. GMROI by category (Gross Margin Return on Inventory)
   = gross margin earned / money invested in stock. Higher = stock works harder.
   So what: tells which category deserves more working capital.
   --------------------------------------------------------------------- */
SELECT m.CategoryName, m.gross_margin, s.stock_cost,
       ROUND(m.gross_margin / NULLIF(s.stock_cost, 0), 2) AS gmroi
FROM (SELECT CategoryName, ROUND(SUM(Profit * OrderItemQuantity), 0) AS gross_margin
      FROM inventory
      WHERE Status = 'Shipped' AND OrderDate > '2016-11-01'   -- last 12 months, same window as the views
      GROUP BY CategoryName) m
JOIN (SELECT CategoryName, ROUND(SUM(stock_value), 0) AS stock_cost
      FROM v_stock_health GROUP BY CategoryName) s
  ON s.CategoryName = m.CategoryName
ORDER BY gmroi DESC;

/* ---------------------------------------------------------------------
   Q7. REVENUE LEAKAGE: how much revenue is lost to cancellations, by category?
   So what: ~1 in 4 order lines is canceled - quantify the damage.
   --------------------------------------------------------------------- */
SELECT CategoryName,
       COUNT(*)                                                                   AS order_lines,
       SUM(CASE WHEN Status = 'Canceled' THEN 1 ELSE 0 END)                       AS canceled_lines,
       ROUND(100.0 * SUM(CASE WHEN Status = 'Canceled' THEN 1 ELSE 0 END) / COUNT(*), 1) AS cancel_rate_pct,
       ROUND(SUM(CASE WHEN Status = 'Canceled' THEN OrderValue ELSE 0 END), 0)    AS lost_revenue
FROM inventory
GROUP BY CategoryName
ORDER BY lost_revenue DESC;

/* ---------------------------------------------------------------------
   Q8. WAREHOUSE SCORECARD: which locations leak revenue or hold backlog?
   So what: pinpoints WHERE to intervene, not just what is wrong.
   --------------------------------------------------------------------- */
SELECT WarehouseName,
       ROUND(SUM(CASE WHEN Status = 'Shipped' THEN OrderValue ELSE 0 END), 0)  AS shipped_revenue,
       ROUND(SUM(CASE WHEN Status = 'Pending' THEN OrderValue ELSE 0 END), 0)  AS pending_backlog,
       ROUND(SUM(CASE WHEN Status = 'Canceled' THEN OrderValue ELSE 0 END), 0) AS canceled_value,
       ROUND(100.0 * SUM(CASE WHEN Status = 'Canceled' THEN 1 ELSE 0 END) / COUNT(*), 1) AS cancel_rate_pct
FROM inventory
GROUP BY WarehouseName
ORDER BY canceled_value DESC;

/* ---------------------------------------------------------------------
   Q9. CUSTOMER CONCENTRATION RISK: how dependent are we on a few customers?
   So what: Big-4 style risk finding (top-10 share of revenue).
   --------------------------------------------------------------------- */
SELECT CustomerName,
       ROUND(SUM(OrderValue), 0)                                              AS revenue,
       ROUND(100.0 * SUM(OrderValue) / SUM(SUM(OrderValue)) OVER (), 1)       AS pct_of_revenue
FROM inventory
WHERE Status <> 'Canceled'
GROUP BY CustomerName
ORDER BY revenue DESC
LIMIT 10;

/* ---------------------------------------------------------------------
   Q10. MONTHLY TREND + GROWTH: is demand rising, and when does it peak?
   So what: feeds the forecast page and the seasonality story.
   --------------------------------------------------------------------- */
SELECT OrderYearMonth,
       SUM(OrderItemQuantity)                                              AS units,
       ROUND(SUM(OrderValue), 0)                                           AS revenue,
       ROUND(100.0 * (SUM(OrderValue) - LAG(SUM(OrderValue)) OVER (ORDER BY OrderYearMonth))
             / NULLIF(LAG(SUM(OrderValue)) OVER (ORDER BY OrderYearMonth), 0), 1) AS mom_growth_pct
FROM inventory
WHERE Status <> 'Canceled' AND OrderDate >= '2016-01-01'
GROUP BY OrderYearMonth
ORDER BY OrderYearMonth;
