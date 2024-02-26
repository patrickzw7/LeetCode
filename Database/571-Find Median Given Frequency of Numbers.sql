# Write your MySQL query statement below

SELECT ROUND(AVG(n.Num), 1) AS MEDIAN
FROM Numbers n
WHERE n.Frequency >= ABS((SELECT SUM(frequency) FROM Numbers WHERE num <= n.num) - (SELECT SUM(frequency) FROM Numbers WHERE num >= n.num))