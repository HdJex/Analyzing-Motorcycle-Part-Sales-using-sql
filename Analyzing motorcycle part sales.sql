-- Analyzing Motorcycle Part Sales


SELECT 
    *
FROM
    atharva.sales1;


-- find the count of no of warehouse in each part of country

SELECT 
    warehouse, COUNT(warehouse)
FROM
    atharva.sales1
GROUP BY warehouse;

-- find the count of no of client types 

SELECT 
    client_type, COUNT(client_type)
FROM
    atharva.sales1
GROUP BY client_type;

-- find the count of no of product line ordered 

SELECT 
    product_line, COUNT(product_line)
FROM
    atharva.sales1
GROUP BY product_line;

-- find the count of most prefered payment mode  

SELECT 
    payment, COUNT(payment)
FROM
    atharva.sales1
GROUP BY payment;

-- find the product line with the most orders quantity

SELECT 
    product_line, SUM(quantity)
FROM
    atharva.sales1
GROUP BY product_line;

-- find the product line with the most profit
SELECT 
    *
FROM
    atharva.sales1;

SELECT 
    product_line, SUM(total) AS profit
FROM
    atharva.sales1
GROUP BY product_line
ORDER BY profit DESC;

-- find the no of orders in each month

UPDATE atharva.sales1 
SET 
    Date = STR_TO_DATE(Date, '%d-%m-%Y')
WHERE
    Date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

ALTER TABLE atharva.sales1
MODIFY COLUMN Date DATE;
SELECT 
    *
FROM
    atharva.sales1;

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, COUNT(*) AS order_count
FROM
    atharva.sales1
GROUP BY month
ORDER BY month;

-- fint the profit in each month

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, SUM(total) AS profit
FROM
    atharva.sales1
GROUP BY month
ORDER BY profit DESC;
    
    