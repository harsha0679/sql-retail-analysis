1. Total Sales & Profit

SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders;

2. Sales by Region

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Revenue
FROM Orders
GROUP BY Region
ORDER BY Revenue DESC;

3. Most Profitable Region
SELECT
    Region,
    ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Region
ORDER BY Profit DESC;

4. Top 10 Products by Sales
SELECT
    Product_Name,
    ROUND(SUM(Sales),2) AS Revenue
FROM Orders
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;


5. Top 10 Products by Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Product_Name
ORDER BY Profit DESC
LIMIT 10;

6. Category Performance
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Category;

7. Sub-Category Performance
SELECT
    Sub_Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Sub_Category
ORDER BY Profit DESC;

8. Top Customers
SELECT
    Customer_Name,
    ROUND(SUM(Sales),2) AS Revenue
FROM Orders
GROUP BY Customer_Name
ORDER BY Revenue DESC
LIMIT 10;

9. Customer Ranking (Window Function)
SELECT
    Customer_Name,
    SUM(Sales) AS Revenue,
    RANK() OVER(ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM Orders
GROUP BY Customer_Name;

10. Monthly Sales Trend

SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Sales),2) AS Revenue
FROM Orders
GROUP BY Year, Month
ORDER BY Year, Month;

11. Segment Analysis
SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Segment;
