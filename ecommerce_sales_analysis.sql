-- =========================================================
-- 📊 E-COMMERCE SALES ANALYSIS (OCTOBER & NOVEMBER 2019)
-- Dataset: sales_oct, sales_nov
-- =========================================================


-- =========================================================
-- 🔍 1. DATA EXPLORATION
-- =========================================================

-- Preview first 10 rows (October data)
SELECT * FROM sales_oct LIMIT 10;

-- Count total rows in October dataset
SELECT COUNT(*) AS total_rows FROM sales_oct;

-- Event type distribution (views, carts, purchases)
SELECT event_type, COUNT(*) AS count
FROM sales_oct
GROUP BY event_type
ORDER BY count DESC;

-- Check schema of October table
PRAGMA table_info(sales_oct);

-- Sample event_time and event_type values
SELECT event_time, event_type
FROM sales_oct
LIMIT 10;


-- =========================================================
-- 📦 2. PRODUCT PERFORMANCE
-- =========================================================

-- Top 10 most purchased products (October)
SELECT product_id, COUNT(*) AS purchases
FROM sales_oct
WHERE event_type = 'purchase'
GROUP BY product_id
ORDER BY purchases DESC
LIMIT 10;

-- Top 10 most purchased products (November)
SELECT product_id, COUNT(*) AS purchases
FROM sales_nov
WHERE event_type = 'purchase'
GROUP BY product_id
ORDER BY purchases DESC
LIMIT 10;


-- =========================================================
-- 📅 3. DAILY ANALYSIS
-- =========================================================

-- Daily purchases (October)
SELECT DATE(event_time) AS date, COUNT(*) AS purchases
FROM sales_oct
WHERE event_type = 'purchase'
GROUP BY DATE(event_time)
ORDER BY date;

-- Daily event counts: views, carts, purchases (October)
SELECT DATE(event_time) AS date,
       SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS views,
       SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carts,
       SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM sales_oct
GROUP BY DATE(event_time)
ORDER BY date;

-- Daily event counts by event_type (alternative view, October)
SELECT substr(event_time, 1, 10) AS event_date,
       event_type,
       COUNT(*) AS event_count
FROM sales_oct
WHERE event_type IN ('view', 'cart', 'purchase')
GROUP BY event_date, event_type
ORDER BY event_date, event_type;


-- =========================================================
-- 📈 4. CONVERSION RATES
-- =========================================================

-- Conversion rates (October)
SELECT substr(event_time, 1, 10) AS date,
       COUNT(CASE WHEN event_type = 'view' THEN 1 END) AS views,
       COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS carts,
       COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchases,
       ROUND(
           CAST(COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS FLOAT) /
           NULLIF(COUNT(CASE WHEN event_type = 'view' THEN 1 END), 0) * 100, 2
       ) AS cart_rate_percent,
       ROUND(
           CAST(COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS FLOAT) /
           NULLIF(COUNT(CASE WHEN event_type = 'cart' THEN 1 END), 0) * 100, 2
       ) AS purchase_rate_percent
FROM sales_oct
WHERE event_time LIKE '2019-10%'
GROUP BY date
ORDER BY date;

-- Conversion rates (November)
SELECT substr(event_time, 1, 10) AS date,
       COUNT(CASE WHEN event_type = 'view' THEN 1 END) AS views,
       COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS carts,
       COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchases,
       ROUND(
           CAST(COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS FLOAT) /
           NULLIF(COUNT(CASE WHEN event_type = 'view' THEN 1 END), 0) * 100, 2
       ) AS cart_rate_percent,
       ROUND(
           CAST(COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS FLOAT) /
           NULLIF(COUNT(CASE WHEN event_type = 'cart' THEN 1 END), 0) * 100, 2
       ) AS purchase_rate_percent
FROM sales_nov
WHERE event_time LIKE '2019-11%'
GROUP BY date
ORDER BY date;


-- =========================================================
-- 📊 5. MONTHLY COMPARISON
-- =========================================================

-- Combine October & November: Monthly totals
SELECT substr(event_time, 1, 7) AS month,
       COUNT(CASE WHEN event_type = 'view' THEN 1 END) AS views,
       COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS carts,
       COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS purchases
FROM (
    SELECT * FROM sales_oct
    UNION ALL
    SELECT * FROM sales_nov
)
GROUP BY month
ORDER BY month;



