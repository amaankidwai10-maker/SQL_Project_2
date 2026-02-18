# Pizza Sales Analysis SQL Project

## Project Overview

**Project Title**: Pizza Sales Analysis 
**Level**: Intermediate
**Database**: 'project2'

This project showcases SQL skills used in real-world data analytics to explore, analyze, and extract insights from pizza sales data. It involves building a database, performing exploratory data analysis (EDA), and answering business-driven questions using SQL queries. The goal is to understand restaurant performance, customer ordering patterns, and product trends.

## Objectives

1. **Set up the pizza sales database**: Create a dedicated database and table for pizza sales.
2. **Data Exploration**: Understand the dataset using SQL queries
3. **Business Analysis****: Answer analytical questions related to sales revenue, customer trends, product performance, and ordering patterns
4. **Insight Generation**: Translate SQL outputs into meaningful business insights.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project begins by creating a database named 'project2'.
- **Table Creation**:A table named 'pizza_sales' is created to store all pizza order information, including order details, pricing, pizza type, size, and ingredients.

```sql
CREATE DATABASE project2;
USE project2;

CREATE TABLE pizza_sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATETIME,
    order_time DATETIME,
    unit_price DECIMAL,
    total_price DECIMAL,
    pizza_size VARCHAR(2),
    pizza_category VARCHAR(30),
    pizza_ingredients VARCHAR(100)
);
```

### 2. Data Exploration & Cleaning
Several foundational queries help explore and understand the dataset:


**View all records**



```sql
SELECT * FROM pizza_sales;
~~~

**Count total records**

~~~sql
SELECT COUNT(*) FROM pizza_sales;
~~~

**Total number of orders**

~~~sql
SELECT COUNT(DISTINCT order_id) FROM pizza_sales;
~~~





###3. Business Analysis & Key SQL Queries

This section includes SQL queries designed to uncover insights related to sales revenue, customer demand, and product performance.

1. **What is the total revenue from the sales**:
```sql
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
```

2. **What is the average order value?**:

```sql
SELECT SUM(total_price) / COUNT(pizza_id) AS average_value FROM pizza_sales;
```

3. **What is the total number of pizza sold?**:

```sql
SELECT DAYNAME(order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;
```

4. **What is the total number of orders placed?**:
```sql
SELECT HOUR(order_time) AS hour_of_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY total_orders DESC;
```

5. **What is the average number of pizzas sold per order?**:

```sql
SELECT COUNT(order_id) AS orders_with_pineapple
FROM pizza_sales
WHERE pizza_ingredients LIKE '%Pineapple%';
```

6. **What is the daily trend for orders?**:

```sql
SELECT pizza_size, COUNT(pizza_id) AS total_sold
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_size
ORDER BY total_sold DESC;
```

7. **At what time of the day should the restaurant staff be up to handle the most orders?**:
```sql
SELECT order_id, SUM(total_price) AS total_amount
FROM pizza_sales
GROUP BY order_id
ORDER BY total_amount DESC
LIMIT 5;
```

8. **How many order actually contain "Pineaplle" ?**:
```sql
Select 
	count(order_id) 
AS 
	orders_with_pineapple 
FROM 
	pizza_sales
WHERE 
	pizza_ingredients LIKE '%Pineapple%';
```

9. **For the 'Classic' category which size is the most popular?**:
```sql
SELECT 
	pizza_size,
    COUNT(pizza_id) AS total_sold
FROM pizza_sales
WHERE pizza_category='Classic'
GROUP BY pizza_size
ORDER BY total_sold DESC;
```

10. **What are the top 5 orders that spent the most money in a single transaction?**:
```sql
SELECT order_id, SUM(total_price) as total_amount
from pizza_sales
GROUP BY order_id
ORDER BY total_amount DESC
LIMIT 5;
```


## Findings

- **Sales Performances**: Total revenue and average order value help track overall business health.
- **Customer Behavior**: The daily and hourly order patterns reveal peak ordering times, helping optimize staffing.
- **Product Insights**: Some pizzas containing ingredients like pineapple show specific customer preferences.
In the Classic category, certain sizes dominate sales.
- **High-Value Orders:**: Identifying the highest-spending orders provides insight into premium customers.

## Reports

- **Sales Summary Report**: Includes total sales, number of orders, and pizzas sold.
- **Trend Analysis**: Shows ordering behavior across days of the week and hours of the day.
- **Customer Insights**:Identifies top-performing pizza sizes and categories.
-**Special Ingredient Insights**: Tracks orders including ingredients like pineapple.


## Conclusion

This pizza sales SQL project provides hands-on experience with database creation, data exploration, and analytical SQL queries. The insights gained can help restaurant owners optimize menus, pricing, staffing, and operational decisions. This analysis forms a strong foundation for further BI dashboarding using tools like Power BI or Tableau.

