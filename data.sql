-- ============================================================================
-- 2. DATA INSERTION
-- ============================================================================

USE sales_db;

-- Insert Products
INSERT INTO products (id, name, category, price) VALUES
(1, 'iPhone 15 Pro', 'Electronics', 1200.00),
(2, 'Sony WH-1000XM5', 'Electronics', 350.00),
(3, 'Mechanical Keyboard', 'Electronics', 85.00),
(4, 'Running Shoes', 'Clothing', 120.00),
(5, 'Winter Jacket', 'Clothing', 199.99),
(6, 'Coffee Maker', 'Home Appliances', 45.00),
(7, 'Argan Hair Oil', 'Grooming', 25.00),
(8, 'Creatine Monohydrate', 'Fitness', 35.00),
(9, 'BCAA Powder', 'Fitness', 28.00),
(10, 'Leather Wallet', 'Clothing', 15.00),
(11, 'Gaming Mouse Pad', 'Electronics', 19.99);

-- Insert Customers
INSERT INTO customers (id, first_name, last_name, email, city) VALUES
(1, 'Turgut', 'Aliyev', 'turgut@gmail.com', 'Baku'),
(2, 'Emin', 'Mammadov', 'emin.m@yahoo.com', 'Baku'),
(3, 'Leyla', 'Hasanova', 'leyla.h@gmail.com', 'Ganja'),
(4, 'Farid', 'Karimov', 'farid.k@gmail.com', 'Sumqayit'),
(5, 'Aysel', 'Ismayilova', 'aysel99@gmail.com', 'Baku'),
(6, 'Murad', 'Gasimov', 'murad.g@outlook.com', 'Baku'),
(7, 'Nigar', 'Rahimova', 'nigar.r@gmail.com', 'Ganja');

-- Insert Orders (Customers with IDs 4 and 7 have no orders for testing purposes)
INSERT INTO orders (id, customer_id, order_date) VALUES
(1, 1, '2024-02-15'),
(2, 1, '2024-05-20'),
(3, 2, '2024-01-10'),
(4, 3, '2023-11-05'),
(5, 5, '2024-03-12'),
(6, 5, '2024-06-01'),
(7, 6, '2024-04-18');

-- Insert Order Items
INSERT INTO order_items (id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 1200.00),
(2, 1, 3, 1, 85.00),
(3, 2, 8, 2, 35.00),
(4, 3, 2, 1, 350.00),
(5, 4, 4, 1, 120.00),
(6, 5, 5, 1, 199.99),
(7, 5, 7, 3, 25.00),
(8, 6, 11, 1, 19.99),
(9, 7, 6, 1, 45.00),
(10, 7, 10, 2, 15.00);
