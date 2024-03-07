# Write your MySQL query statement below

WITH CommonFollows AS 
(SELECT r1.user_id AS user1_id,
        r2.user_id AS user2_id,
        r1.follower_id AS follower
FROM Relations r1, Relations r2
WHERE r1.user_id < r2.user_id
AND r1.follower_id = r2.follower_id),

Counts AS (
SELECT user1_id, user2_id, COUNT(follower) AS count_follower
FROM CommonFollows
GROUP BY user1_id, user2_id
)

SELECT user1_id, user2_id
FROM Counts
WHERE count_follower = (SELECT MAX(count_follower) FROM Counts)
;