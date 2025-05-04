-- create database salesDB
-- SELECT checkNumber, paymentDate, amount
-- FROM payments;
-- SELECT orderDate, requiredDate, status
-- FROM orders
-- WHERE status = 'In Process'
-- ORDER BY orderDate DESC;
-- SELECT firstName, lastName, email
-- FROM employees
-- WHERE jobTitle = 'Sales Rep'
-- ORDER BY employeeNumber DESC;
-- SELECT * 
-- FROM offices;
-- SELECT productName, quantityInStock
-- FROM products
-- ORDER BY buyPrice ASC
-- LIMIT 5;

-- 

-- 5 latest total payment amount for Each Payment Date 
-- SELECT payment_date, SUM(amount) AS total_payment
-- FROM payments
-- GROUP BY payment_date
-- ORDER BY payment_date DESC
-- LIMIT 5;

-- -- Average credit limit of each customer
-- SELECT customer_name, country, AVG(credit_limit) AS avg_credit_limit
-- FROM customers
-- GROUP BY customer_name, country;

-- -- Total price of products ordered
-- SELECT product_code, quantity_ordered, SUM(quantity_ordered * price_each) AS total_price
-- FROM orderdetails
-- GROUP BY product_code, quantity_ordered;

-- -- Highest payment amount for each check number
-- SELECT check_number, MAX(amount) AS highest_payment
-- FROM payments
-- GROUP BY check_number;

-- -- Drop an index named IdxPhone from the customers table
-- DROP INDEX IdxPhone ON customers;

-- -- Create a user named bob with the password 'S$cu3r3!', restricted to localhost
-- CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- -- Grant the INSERT privilege to bob on the salesDB database
-- GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- -- Change the password for the user bob to 'P$55!23'
-- ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';


-- -- Get productName, productVendor, and productLine using a left join
-- SELECT 
--     p.productName,
--     p.productVendor,
--     p.productLine
-- FROM 
--     products p
-- LEFT JOIN 
--     productlines pl ON p.productLine = pl.productLine;

-- -- Retrieve orderDate, shippedDate, status, and customerNumber for the first 10 orders using a right join
-- SELECT 
--     o.orderDate,
--     o.shippedDate,
--     o.status,
--     o.customerNumber
-- FROM 
--     customers c
-- RIGHT JOIN 
--     orders o ON c.customerNumber = o.customerNumber
-- LIMIT 10;


-- First, let's assume this is your raw data
WITH ProductDetail AS (
  SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop, Mouse' AS Products UNION ALL
  SELECT 102, 'Jane Smith', 'Tablet, Keyboard, Mouse' UNION ALL
  SELECT 103, 'Emily Clark', 'Phone'
),
SplitProducts AS (
  SELECT
    OrderID,
    CustomerName,
    TRIM(value) AS Product
  FROM ProductDetail
  CROSS APPLY STRING_SPLIT(Products, ',')
)
SELECT * FROM SplitProducts;


-- Extract distinct orders and customer names
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Each product per order with quantity
SELECT OrderID, Product, Quantity
FROM OrderDetails;
