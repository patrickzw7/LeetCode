# Write your MySQL query statement below

WITH VoteProb AS (
SELECT voter,
       candidate,
       ROUND(1 / (COUNT(candidate) OVER (PARTITION BY voter)), 2) AS prob
FROM Votes 
WHERE candidate IS NOT NULL),

VoteCount AS (
    SELECT candidate,
           SUM(prob) AS votes
    FROM VoteProb
    GROUP BY candidate
    ORDER BY votes DESC
)

SELECT candidate
FROM VoteCount
WHERE votes = (
    SELECT MAX(votes) FROM VoteCount
)
ORDER BY candidate ASC;
