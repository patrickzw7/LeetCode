# Write your MySQL query statement below

WITH Basics AS 
(SELECT DISTINCT customer_id,
        name, 
        LEFT(order_date, 7) AS date_month,
        IFNULL(SUM(quantity * price) OVER(PARTITION BY customer_id, LEFT(order_date, 7)), 0) AS total
FROM Customers
LEFT JOIN Orders
USING (customer_id)
LEFT JOIN Product
USING (product_id))

SELECT DISTINCT b1.customer_id,
       b1.name
FROM Basics b1
LEFT JOIN Basics b2
ON b1.name = b2.name
WHERE b1.total >= 100 AND b2.total >= 100 AND b1.date_month = "2020-07" AND b2.date_month = "2020-06";