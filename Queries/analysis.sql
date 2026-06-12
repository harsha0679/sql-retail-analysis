-- ==========================================
-- Retail Sales & Profit Analysis using SQL
-- Dataset: Sample Superstore
-- ==========================================

-- 1. Total Sales, Profit and Quantity Sold

SELECT
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM SampleSuperstore;

-- ==========================================
-- 2. Sales by Region
-- ==========================================

SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue
FROM SampleSuperstore
GROUP BY Region
ORDER BY Revenue DESC;

-- Insight:
-- Identify the highest revenue-generating region.

-- ==========================================
-- 3. Profit by Region
-- ==========================================

SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit
FROM SampleSuperstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- ==========================================
-- 4. Category-wise Performance
-- ==========================================

SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM SampleSuperstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- ==========================================
-- 5. Sub-Category Analysis
-- ==========================================

SELECT
"Sub-Category",
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM SampleSuperstore
GROUP BY "Sub-Category"
ORDER BY Revenue DESC;

-- ==========================================
-- 6. Top 10 Products by Sales
-- ==========================================

SELECT
"Product Name",
ROUND(SUM(Sales),2) AS Revenue
FROM SampleSuperstore
GROUP BY "Product Name"
ORDER BY Revenue DESC
LIMIT 10;

-- ==========================================
-- 7. Top 10 Most Profitable Products
-- ==========================================

SELECT
"Product Name",
ROUND(SUM(Profit),2) AS Profit
FROM SampleSuperstore
GROUP BY "Product Name"
ORDER BY Profit DESC
LIMIT 10;

-- ==========================================
-- 8. Top 10 Customers by Revenue
-- ==========================================

SELECT
"Customer Name",
ROUND(SUM(Sales),2) AS Revenue
FROM SampleSuperstore
GROUP BY "Customer Name"
ORDER BY Revenue DESC
LIMIT 10;

-- ==========================================
-- 9. Segment Analysis
-- ==========================================

SELECT
Segment,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM SampleSuperstore
GROUP BY Segment
ORDER BY Revenue DESC;

-- ==========================================
-- 10. State-wise Revenue Analysis
-- ==========================================

SELECT
State,
ROUND(SUM(Sales),2) AS Revenue
FROM SampleSuperstore
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

-- ==========================================
-- 11. Discount Impact on Profit
-- ==========================================

SELECT
Discount,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM SampleSuperstore
GROUP BY Discount
ORDER BY Discount;

-- Insight:
-- Analyze how discounts affect profitability.

-- ==========================================
-- 12. Customer Ranking (Window Function)
-- ==========================================

SELECT
"Customer Name",
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(
ORDER BY SUM(Sales) DESC
) AS Customer_Rank
FROM SampleSuperstore
GROUP BY "Customer Name";

-- ==========================================
-- 13. Top 3 Products in Each Category
-- (CTE + Window Function)
-- ==========================================

WITH ProductSales AS (
SELECT
Category,
"Product Name",
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(
PARTITION BY Category
ORDER BY SUM(Sales) DESC
) AS Product_Rank
FROM SampleSuperstore
GROUP BY Category, "Product Name"
)

SELECT *
FROM ProductSales
WHERE Product_Rank <= 3;

-- ==========================================
-- 14. Top 5 Loss-Making Products
-- ==========================================

SELECT
"Product Name",
ROUND(SUM(Profit),2) AS Profit
FROM SampleSuperstore
GROUP BY "Product Name"
ORDER BY Profit ASC
LIMIT 5;

-- ==========================================
-- 15. Average Order Value
-- ==========================================

SELECT
ROUND(AVG(Sales),2) AS Average_Order_Value
FROM SampleSuperstore;

-- ==========================================
-- Project Insights
-- ==========================================

-- 1. Identified top-performing regions and states.
-- 2. Analyzed category and sub-category profitability.
-- 3. Ranked customers based on revenue contribution.
-- 4. Evaluated discount impact on profit margins.
-- 5. Identified best-selling and loss-making products.
-- 6. Applied Aggregate Functions, CTEs and Window Functions.
