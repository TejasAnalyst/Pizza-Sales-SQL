CREATE DATABASE pizza_sales;


USE pizza_sales;
SELECT * FROM pizza_types;



USE pizza_sales;

SELECT COUNT(*) FROM pizza_types;
SELECT COUNT(*) FROM pizzas;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_details;

SELECT
    SUM(order_details.quantity * pizzas.price) AS Total_Revenue
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
    
    
SELECT
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Total_Revenue
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;    
    
    
    
SELECT
    ROUND(
        SUM(order_details.quantity * pizzas.price) / COUNT(DISTINCT order_details.order_id),
    2) AS Avg_Order_Value
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;    
    
    
    
SELECT
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS Total_Revenue
FROM pizza_types
JOIN pizzas
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Revenue DESC
LIMIT 5;    




SELECT
    pizza_types.name,
    SUM(order_details.quantity) AS Total_Quantity
FROM pizza_types
JOIN pizzas
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Quantity DESC
LIMIT 5;





SELECT
    HOUR(time) AS Hour_of_Day,
    COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY Hour_of_Day
ORDER BY Total_Orders DESC;