# Write your MySQL query statement below

WITH ActCountDesc AS (
SELECT activity, COUNT(activity) as count_act
FROM Friends
GROUP BY activity
ORDER BY COUNT(activity) DESC
)


SELECT activity
FROM ActCountDesc
WHERE count_act < (SELECT MAX(count_act) FROM ActCountDesc) AND count_act > (SELECT MIN(count_act) FROM ActCountDesc);