# Write your MySQL query statement below

SELECT s.gender,
       s.day,
       SUM(s.score_points) OVER (
        PARTITION BY s.gender
        ORDER BY s.day ASC
    ) AS total
FROM Scores s
GROUP BY s.gender, s.day
ORDER BY gender ASC, day ASC;