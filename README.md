# Sales Database & Analytics Project

This project focuses on managing sales data, building a relational database schema, and executing analytic SQL queries to satisfy specific business requirements.

## 📂 Project Structure

* **`schema.sql`** — Database initialization, table structures, and relational `FOREIGN KEY` constraints (DDL).
* **`data.sql`** — Synthetic datasets containing products, customers, and order history for testing queries (DML).
* **`queries.sql`** — Comprehensive SQL solutions for simple, conditional, aggregate, and complex `JOIN` queries (DQL).

## 🛠️ Database Architecture

The relational model consists of 4 main tables designed to avoid data redundancy:
1. `products` — Product details including name, category, and standard pricing.
2. `customers` — Customer profile records including names, emails, and demographic city info.
3. `orders` — Main transaction headers connecting customers to transaction dates.
4. `order_items` — Relational transaction details logging precise product quantities and sale prices.

## 🚀 Execution Steps

To deploy and test this project locally inside any standard SQL terminal:
1. Initialize the environment by executing `schema.sql`.
2. Populate the tables with mock data by running `data.sql`.
3. Test and review analytical insights using `queries.sql`.
