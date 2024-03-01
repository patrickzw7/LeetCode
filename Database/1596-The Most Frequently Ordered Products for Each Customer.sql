# Write your MySQL query statement below

WITH NumOrders AS (
SELECT customer_id,
       product_id,
       product_name,
       COUNT(*) AS buy_times
FROM Orders
INNER JOIN Products
USING (product_id)
GROUP BY customer_id, product_id, product_name
),

TopNumOrders AS (
SELECT customer_id,
       product_id,
       product_name,
       (DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY buy_times DESC)) AS ranking
FROM NumOrders
)

SELECT customer_id,
       product_id,
       product_name
FROM TopNumOrders
WHERE ranking = 1;
