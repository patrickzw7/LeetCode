# Write your MySQL query statement below

SELECT DISTINCT request_at AS Day, 
       ROUND(SUM(status LIKE '%cancelled%') / COUNT(status), 2) AS 'Cancellation Rate'
FROM 
(
    SELECT Trips.id,
           Trips.request_at,
           Trips.status
    FROM Trips 
    INNER JOIN Users Users_client
    ON Trips.client_id = Users_client.users_id 
        AND Users_client.role = 'client'
        AND Users_client.banned = 'No'
    INNER JOIN Users Users_driver
    ON Trips.driver_id = Users_driver.users_id
        AND Users_driver.role = 'driver'
        AND Users_driver.banned = 'No'
) AS temp
WHERE temp.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY temp.request_at;
