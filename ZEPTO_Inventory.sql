CREATE DATABASE ZEPTO_ANALYSIS;

USE ZEPTO_ANALYSIS;

SELECT * FROM ZEPTO;

-- Distinct categories of products 
SELECT DISTINCT Category
FROM ZEPTO;

-- Products with price (High to Low)
SELECT * 
FROM ZEPTO
ORDER BY mrp DESC;

-- Products with discountPercent (High to Low)
SELECT Category, mrp, availableQuantity, discountPercent, discountedSellingPrice, quantity
FROM ZEPTO
ORDER BY discountPercent DESC;

-- Average Price of Products 
SELECT AVG(mrp)
FROM ZEPTO;

-- Products with no discount 
SELECT *
FROM ZEPTO
WHERE DISCOUNTPERCENT IS NULL;

-- Sum of available quantity of products 
SELECT SUM(AVAILABLEQUANTITY)
FROM ZEPTO;

-- Products that are not Out of Stock 
SELECT CATEGORY, MRP, DISCOUNTPERCENT, AVAILABLEQUANTITY, DISCOUNTEDSELLINGPRICE, OUTOFSTOCK
FROM ZEPTO
WHERE OUTOFSTOCK = 'FALSE'; 

-- Count of all In Stock Products
SELECT COUNT(OUTOFSTOCK)
FROM ZEPTO
WHERE OUTOFSTOCK = 'FALSE'; 

-- Adding sku column 
ALTER TABLE zepto_analysis.ZEPTO
ADD sku_id SERIAL PRIMARY KEY;  

-- Products In Stock vs Out of Stock
Select outOfStock, Count(sku_id)
From ZEPTO
GROUP BY outOfStock;

-- Prroduct name present multiple times
Select name, COUNT(sku_id) as "Numbeer of SKUs"
From ZEPTO
GROUP BY Name
HAVING count(sku_id) >1
ORDER BY COUNT(sku_id) DESC;

-- Data CLeaning 
SELECT *
FROM ZEPTO
WHERE mrp = 0 OR discountedSellingPrice = 0; 

DELETE FROM ZEPTO
WHERE mrp= 0;

-- Convert Paise to Rupees
UPDATE ZEPTO
SET mrp = mrp/100.0,
discountedSellingPrice= discountedSellingPrice/100.0;

-- SOLVING SOME BUSINESS RELATED QUESTIONS.
-- Q1. Top 10 best value products
SELECT DISTINCT name, mrp, discountPercent, discountedSellingPrice
FROM ZEPTO
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. What are the Products with High MRP but Out of Stock 
SELECT DISTINCT name, mrp
FROM ZEPTO
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Q3. Calculate Estimated Revenue for each Category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM ZEPTO
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM ZEPTO
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percent.
SELECT category,
ROUND(AVG(discountPercent),2) as avg_discount
FROM ZEPTO 
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;  

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/ weightInGms *2) AS price_per_gram
FROM ZEPTO
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7. Group the products into categories like low, medium, bulk
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
    ELSE 'Bulk'
    END AS Weight_Category
FROM ZEPTO;

-- Q8. What is the Total Inventory Weight Per Category
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM ZEPTO
GROUP BY category
ORDER BY total_weight;