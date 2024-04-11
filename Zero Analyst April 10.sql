CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO customers (customer_id, customer_name, customer_email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Bob Brown', 'bob@example.com');

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 1, '2024-01-03', 50.00),
(2, 2, '2024-01-05', 75.00),
(3, 1, '2024-01-10', 25.00),
(4, 3, '2024-01-15', 60.00),
(5, 2, '2024-01-20', 50.00),
(6, 1, '2024-02-01', 100.00),
(7, 2, '2024-02-05', 25.00),
(8, 3, '2024-02-10', 90.00),
(9, 1, '2024-02-15', 50.00),
(10, 2, '2024-02-20', 75.00);


SELECT * FROM CUSTOMERS
SELECT * FROM ORDERS

-- Find the top 2 customers who have spent the most money across all their orders. 
-- Return their names, emails, and total amounts spent.




SELECT c.CUSTOMER_NAME,
       c.CUSTOMER_EMAIL,
	   SUM(o.ORDER_AMOUNT)AS TOTAL_AMOUNT_SPENT
FROM CUSTOMERS c
JOIN ORDERS o 
ON c.CUSTOMER_ID=o.CUSTOMER_ID
GROUP BY c.CUSTOMER_NAME,c.CUSTOMER_EMAIL
ORDER BY SUM(o.ORDER_AMOUNT) DESC
LIMIT 2

--Find out customers details who has placed highest orders and total count of orders and total order amount


(SELECT c.CUSTOMER_NAME,
        c.CUSTOMER_EMAIL, 
       count(o.ORDER_ID) AS TOTAL_COUNT_OF_ORDERS
FROM CUSTOMERS c
JOIN ORDERS o
ON c.customer_id=o.customer_id
GROUP BY c.CUSTOMER_NAME,c.CUSTOMER_EMAIL
ORDER BY TOTAL_COUNT_OF_ORDERS DESC
LIMIT 1) 

--TASK Find out customers details who has placed highest orders and total count of orders and total order amount

SELECT
    c.customer_id,
    c.customer_name,
    c.customer_email,
    order_counts.total_orders AS total_orders_placed,
    order_amounts.total_amount_spent
FROM customers AS c
JOIN (
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
    ORDER BY total_orders DESC
    LIMIT 1
) AS order_counts ON c.customer_id = order_counts.customer_id
JOIN (
    SELECT
        customer_id,
        SUM(order_amount) AS total_amount_spent
    FROM orders
    GROUP BY customer_id
) AS order_amounts ON c.customer_id = order_amounts.customer_id;


