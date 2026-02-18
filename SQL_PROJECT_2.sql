create database project2;
use project2;

DROP TABLE IF EXISTS pizza_sales; 
CREATE TABLE pizza_sales(
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

select * from pizza_sales;

select count(*) from pizza_sales;

# Q1. What is the total revenue from the sales?

select SUM(total_price) as total_revenue from pizza_sales;


# Q2. What is the average order value?

select SUM(total_price)/ COUNT(pizza_id) as average_value from pizza_sales;

  
# Q3. What is the total number of pizza sold?

select sum(quantity) as total_quantity from pizza_sales;


# Q4. What is the total number of orders placed?

select COUNT(DISTINCT order_id) as orders_placed from pizza_sales;


# Q5. What is the average number of pizzas sold per order?

select (quantity)/ COUNT(DISTINCT order_id) as average_sale from pizza_sales;


# Q6. What is the daily trend for orders?

SELECT DAYNAME(order_date) as order_day,
	COUNT(DISTINCT order_id) as total_orders from pizza_sales
    GROUP BY DAYNAME(order_date)
    ORDER BY total_orders DESC;
    
    
# Q7. At what time of the day should the restaurant staff be up to handle the most orders?

SELECT 
	HOUR(order_time) AS day_hours,
	COUNT(DISTINCT order_id) AS total_orders 
FROM 
	pizza_sales
GROUP BY
	HOUR(order_time)
ORDER
	BY total_orders DESC;
    
# Q8. How many order actually contain "Pineaplle" ?

Select 
	count(order_id) 
AS 
	orders_with_pineapple 
FROM 
	pizza_sales
WHERE 
	pizza_ingredients LIKE '%Pineapple%';
    
    
# Q9. For the 'Classic' category which size is the most popular?

SELECT 
	pizza_size,
    COUNT(pizza_id) AS total_sold
FROM pizza_sales
WHERE pizza_category='Classic'
GROUP BY pizza_size
ORDER BY total_sold DESC;


# Q10. What are the top 5 orders that spent the most money in a single transaction?

SELECT order_id, SUM(total_price) as total_amount
from pizza_sales
GROUP BY order_id
ORDER BY total_amount DESC
LIMIT 5;