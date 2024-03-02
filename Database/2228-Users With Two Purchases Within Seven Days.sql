# Write your MySQL query statement below

WITH PurchasesNew AS (
SELECT user_id,
       purchase_date,
       LAG(purchase_date) OVER(PARTITION BY user_id ORDER BY purchase_date ASC) as prev_purchase_date
FROM Purchases
)

SELECT DISTINCT user_id
FROM PurchasesNew
WHERE prev_purchase_date IS NOT NULL
AND DATEDIFF(purchase_date, prev_purchase_date) < 8;