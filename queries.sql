-- ============================================================================
-- 3. SQL QUERIES
-- ============================================================================

USE sales_db;

-- ----------------------------------------------------------------------------
-- 1. SIMPLE QUERIES
-- ----------------------------------------------------------------------------

-- Select all products.
SELECT * FROM products;

-- Show only product names and prices.
SELECT name, price FROM products;

-- List all customers.
SELECT * FROM customers;

-- Show distinct categories from products.
SELECT DISTINCT category FROM products;

-- Get the first 10 products.
SELECT * FROM products LIMIT 10;


-- ----------------------------------------------------------------------------
-- 2. CONDITIONAL QUERIES
-- ----------------------------------------------------------------------------

-- Find all products with price > 50.
SELECT * FROM products WHERE price > 50;

-- Get all customers from the city 'Baku'.
SELECT * FROM customers WHERE city = 'Baku';

-- Find products in the category 'Electronics'.
SELECT * FROM products WHERE category = 'Electronics';

-- Show orders created after '2024-01-01'.
SELECT * FROM orders WHERE order_date > '2024-01-01';

-- List customers whose email ends with '@gmail.com'.
SELECT * FROM customers WHERE email LIKE '%@gmail.com';

-- Products priced between 20 and 80.
SELECT * FROM products WHERE price BETWEEN 20 AND 80;

-- Products not in category 'Clothing'.
SELECT * FROM products WHERE category <> 'Clothing';


-- ----------------------------------------------------------------------------
-- 3. AGGREGATE FUNCTIONS
-- ----------------------------------------------------------------------------

-- Count total number of products.
SELECT COUNT(*) AS total_products FROM products;

-- Calculate average product price.
SELECT AVG(price) AS average_price FROM products;

-- Count total number of customers.
SELECT COUNT(*) AS total_customers FROM customers;

-- Sum the quantities of all sold items.
SELECT SUM(quantity) AS total_items_sold FROM order_items;

-- Count how many orders each customer made.
SELECT customer_id, COUNT(*) AS order_count 
FROM orders 
GROUP BY customer_id;

-- Find the highest priced product.
SELECT * FROM products ORDER BY price DESC LIMIT 1;

-- Count how many products belong to each category.
SELECT category, COUNT(*) AS product_count 
FROM products 
GROUP BY category;


-- ----------------------------------------------------------------------------
-- 4. JOIN QUERIES
-- ----------------------------------------------------------------------------

-- Show all orders with the customer's full name.
SELECT orders.id AS order_id, customers.first_name, customers.last_name, orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.id;

-- List each ordered product with: product name, quantity, order date.
SELECT products.name AS product_name, order_items.quantity, orders.order_date
FROM order_items
JOIN products ON order_items.product_id = products.id
JOIN orders ON order_items.order_id = orders.id;

-- Show how many total items each customer purchased.
SELECT customers.id AS customer_id, customers.first_name, customers.last_name, SUM(order_items.quantity) AS total_purchased
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY customers.id, customers.first_name, customers.last_name;

-- Calculate total amount spent by each customer (price × quantity).
SELECT customers.id AS customer_id, customers.first_name, customers.last_name, SUM(order_items.price * order_items.quantity) AS total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY customers.id, customers.first_name, customers.last_name;

-- Show all orders (with product details) placed in 2024.
SELECT orders.id AS order_id, orders.order_date, products.name AS product_name, order_items.quantity, order_items.price
FROM orders
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE orders.order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Show customers who have never placed an order.
SELECT customers.*
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.id IS NULL;

-- Find the top 5 customers by total items purchased.
SELECT customers.id AS customer_id, customers.first_name, customers.last_name, SUM(order_items.quantity) AS total_items
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY customers.id, customers.first_name, customers.last_name
ORDER BY total_items DESC
LIMIT 5;
