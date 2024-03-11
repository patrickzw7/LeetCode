# Write your MySQL query statement below
WITH RECURSIVE Months(month, yearmonth) AS (
SELECT 1 AS month, CONCAT('2020-', LPAD(1, 2, '0')) AS yearmonth
UNION ALL
SELECT month + 1, CONCAT('2020-', LPAD(month + 1, 2, '0'))
FROM Months
WHERE month < 12
),

Actives AS (
SELECT month,
       COUNT(driver_id) AS active_drivers
FROM Months
LEFT JOIN Drivers 
ON DATE_FORMAT(join_date, "%Y-%m") <= yearmonth
GROUP BY month
),

Accepted AS (
SELECT month,
       IFNULL(COUNT(ride_id), 0)  AS accepted_rides
FROM Rides
INNER JOIN AcceptedRides
USING (ride_id)
RIGHT JOIN months
ON DATE_FORMAT(requested_at, "%Y-%m") = yearmonth
GROUP BY month)

SELECT * FROM Actives
INNER JOIN Accepted
USING (month);
