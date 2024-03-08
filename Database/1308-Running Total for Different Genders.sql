SELECT s2.gender, s2.day,
       SUM(s1.score_points) AS total
FROM Scores s1 
JOIN Scores s2
ON s1.gender = s2.gender AND s2.day >= s1.day
GROUP BY s2.gender, s2.day
ORDER BY s2.gender, s2.day;
