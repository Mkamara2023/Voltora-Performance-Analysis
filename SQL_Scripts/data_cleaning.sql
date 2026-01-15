-- ==========================================================================================
-- PROJECT: Voltora Data Audit & ETL Pipeline
-- PURPOSE: Data Cleaning, Standardization, and Schema Optimization
-- ==========================================================================================

-- Initial Data Inspection
SELECT * FROM Voltora_Data.`orders raw`;

-- ------------------------------------------------------------------------------------------
-- 1. CLEANING THE ORDERS TABLE
-- ------------------------------------------------------------------------------------------

-- Data Cleaning -- 
-- 1. Remove Duplicates
-- 2. Standardize The Data
-- 3. Null Values or Blank Values 
-- 4. Remove Any Columns 

-- We will clean each table before exploration -- 

-- Create a new table so we don't work on raw data -- 
-- 1st Table - Orders Raw -- 

CREATE TABLE Orders_clean
LIKE Voltora_Data.`orders raw`;

SELECT * FROM Orders_clean;

INSERT INTO  Orders_clean 
SELECT * FROM Voltora_Data.`orders raw`;

SELECT * FROM Orders_clean; 

-- Now the new table is create I will now inspect for any Duplicates -- 

SELECT *,
ROW_NUMBER()OVER(
PARTITION BY
customer_id, order_id, purchase_ts, product_id, product_name, currency, local_price, usd_price, purchase_platform) AS Row_num 
FROM Orders_clean;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER()OVER(
PARTITION BY
customer_id, order_id, purchase_ts, product_id, product_name, currency, local_price, usd_price, purchase_platform) AS Row_num 
FROM Orders_clean
)
SELECT *
FROM duplicate_cte 
WHERE row_num >1; 

-- There are no duplicates -- 

SELECT order_id, COUNT(*)
FROM Orders_clean
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT * FROM Orders_clean; 

-- Standardising Data (Trimming & Naming Conventions) -- 

SELECT Distinct product_name, TRIM(product_name)
FROM Orders_clean;

UPDATE Orders_clean 
SET product_name = TRIM(product_name);

SELECT * FROM Orders_clean;

SELECT Distinct purchase_platform, TRIM(purchase_platform)
FROM Orders_Clean;

SELECT Distinct(purchase_platform)
FROM Orders_clean
ORDER BY 1; 

UPDATE Orders_Clean
SET purchase_platform = 'Mobile app' 
WHERE purchase_platform LIKE 'mobile app%';

SELECT Distinct(purchase_platform)
FROM Orders_clean
Order by 1;

UPDATE Orders_clean
SET purchase_platform = 'Desktop'
WHERE purchase_platform = 'DESKTOP';

SELECT * FROM Orders_Clean; 

-- Standardising Currency & Pricing --

SELECT Distinct(currency) 
FROM Orders_Clean; 

UPDATE Orders_clean 
SET currency = 'USD' 
WHERE currency LIKE 'US D%';

SELECT Distinct(currency) FROM Orders_Clean; 

SELECT * FROM Orders_Clean; 

-- Fixing Date Formats for Orders Table --

SELECT distinct(purchase_ts) FROM Orders_clean;

SELECT purchase_ts, STR_TO_DATE(purchase_ts, '%m/%d/%Y') FROM Orders_clean; 

ALTER TABLE Orders_Clean MODIFY COLUMN purchase_ts DATE;

SELECT * FROM orders_clean; 

SELECT Distinct(Purchase_ts) FROM Orders_Clean;

-- Rounding Financial Decimals --

UPDATE Orders_clean
SET usd_price = ROUND(usd_price, 2),
    local_price = ROUND(local_price, 2)
WHERE usd_price != ROUND(usd_price, 2) 
   OR local_price != ROUND(local_price, 2);
   
SELECT * FROM orders_clean; 

-- Handling Null Values or Blank Values (Orders) --

SELECT distinct product_name FROM Orders_Clean ORDER BY 1; 

UPDATE Orders_clean
SET product_name = 'Unknown'
WHERE product_name IS NULL OR product_name = '';
   
UPDATE Orders_clean
SET purchase_platform = 'Unknown'
WHERE purchase_platform IS NULL OR purchase_platform = '';
   
SELECT * FROM orders_clean; 

SELECT distinct purchase_platform FROM Orders_Clean ORDER BY 1; 

UPDATE Orders_clean
SET purchase_platform = 'Unknown'
WHERE purchase_platform IS NULL OR purchase_platform = '';

SELECT * FROM Orders_Clean;

UPDATE Orders_clean
SET purchase_platform = 'Unknown'
WHERE purchase_platform IS NULL OR TRIM(purchase_platform) = '';
   
SELECT * FROM Orders_Clean;

SELECT * FROM Orders_clean WHERE product_name = 'Magsafe Power Bank'; 

-- ------------------------------------------------------------------------------------------
-- 2. CLEANING THE CUSTOMER TABLE
-- ------------------------------------------------------------------------------------------


SELECT * FROM Voltora_Data.customer_raw;

CREATE TABLE Customer_clean
LIKE Voltora_Data.customer_raw;

SELECT * FROM Customer_clean; 

INSERT INTO Customer_clean
SELECT * FROM Voltora_Data.customer_raw;

SELECT * FROM Customer_clean; 

-- Duplicate Inspection for Customers -- 

SELECT *,
ROW_NUMBER()OVER(
PARTITION BY
id, marketing_channel, account_creation_method, country_code, loyalty_program, created_on) AS Row_num
FROM Customer_clean;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER()OVER(
PARTITION BY
id, marketing_channel, account_creation_method, country_code, loyalty_program, created_on) AS Row_num
FROM Customer_clean
)
SELECT *
FROM duplicate_cte 
WHERE row_num >1; 

SELECT id, COUNT(*)
FROM Customer_clean
GROUP BY id
HAVING COUNT(*) > 1;

-- There are no duplicates --  

-- Standardising Customer Data --  

SELECT * FROM Customer_clean;

SELECT Distinct marketing_channel, TRIM(marketing_channel) FROM Customer_clean;

SELECT Distinct account_creation_method, TRIM(account_creation_method) FROM Customer_clean;

UPDATE Customer_Clean
SET account_creation_method = 'Apple ID' 
WHERE account_creation_method LIKE 'Appleid%';

SELECT Distinct country_code, TRIM(country_code) FROM Customer_clean;

SELECT Distinct loyalty_program, TRIM(loyalty_program) FROM Customer_clean;

-- Customer Date Formatting --

UPDATE Customer_clean SET created_on = TRIM(created_on);

SELECT Distinct created_on, TRIM(created_on) FROM Customer_clean;

UPDATE Customer_clean SET created_on = NULL WHERE TRIM(created_on) = '';

ALTER TABLE Customer_clean MODIFY COLUMN created_on DATE;

SELECT * FROM Customer_clean;

UPDATE Customer_clean
SET marketing_channel = 'Unknown'
WHERE marketing_channel IS NULL OR marketing_channel = '';

SELECT Distinct(created_on) FROM Customer_clean; 

-- ------------------------------------------------------------------------------------------
-- 3. GEO LOOKUP CLEANING
-- ------------------------------------------------------------------------------------------

SELECT * FROM Voltora_Data.geo_lookup_raw;

CREATE TABLE Geo_lookup_clean
LIKE Voltora_Data.geo_lookup_raw;

INSERT INTO Geo_lookup_clean
SELECT * FROM Voltora_Data.geo_lookup_raw;

SELECT * FROM Geo_lookup_clean; 

-- Correction: Mapping missing region for France (FR) -- 

UPDATE Geo_lookup_clean
SET region = 'Europe'
WHERE country = 'FR';

-- ------------------------------------------------------------------------------------------
-- 4. ORDER STATUS TABLE CLEANING
-- ------------------------------------------------------------------------------------------


SELECT * FROM Voltora_Data.order_status_raw;

CREATE TABLE Order_status_clean 
LIKE Voltora_Data.order_status_raw;

INSERT INTO Order_status_clean
SELECT * FROM Voltora_Data.order_status_raw;

SELECT * FROM Order_status_clean; 

-- Duplicate Inspection (Status Table) -- 

SELECT *,
ROW_NUMBER()OVER(
PARTITION BY
order_id, purchase_ts, ship_ts, delivery_ts, refund_ts) AS Row_num 
FROM Order_status_clean;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER()OVER(
PARTITION BY order_id, purchase_ts, ship_ts, delivery_ts, refund_ts) AS Row_num
FROM Order_status_clean) 
SELECT * FROM duplicate_cte
WHERE row_num >1;

-- There are no duplicates --  

SELECT * FROM Order_status_clean; 

-- Fixing Logistics Dates & Handling 'None' Values --

Select distinct(purchase_ts) FROM Order_status_clean;

ALTER TABLE Order_status_clean MODIFY COLUMN purchase_ts DATE;

UPDATE Order_status_clean
SET ship_ts = NULL
WHERE TRIM(ship_ts) = '' 
   OR ship_ts = 'None'
   OR ship_ts IS NULL;
   
ALTER TABLE Order_status_clean MODIFY COLUMN ship_ts DATE;

UPDATE Order_status_clean
SET delivery_ts = NULL
WHERE TRIM(delivery_ts) = '' 
   OR delivery_ts = 'None'
   OR delivery_ts IS NULL;

ALTER TABLE Order_status_clean MODIFY COLUMN delivery_ts DATE;

UPDATE Order_status_clean
SET refund_ts = NULL
WHERE TRIM(refund_ts) = '' 
   OR refund_ts = 'None'
   OR refund_ts IS NULL;
   
ALTER TABLE Order_status_clean MODIFY COLUMN refund_ts DATE;

SELECT * FROM Order_status_clean; 

-- ------------------------------------------------------------------------------------------
-- 5. creating new time-based categories 
-- ------------------------------------------------------------------------------------------

-- Extracting Year and Month to enable Time-Series Analysis in Tableau --

ALTER TABLE Orders_clean ADD COLUMN purchase_year INT; 

SELECT * FROM Orders_Clean; 

UPDATE Orders_clean SET purchase_year = YEAR(purchase_ts);

SELECT * FROM Orders_Clean; 

ALTER TABLE Orders_clean ADD COLUMN purchase_month INT;

UPDATE Orders_Clean SET purchase_month = MONTH(purchase_ts);

SELECT * FROM Orders_Clean;
