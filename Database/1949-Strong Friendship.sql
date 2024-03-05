# Write your MySQL query statement below

With CommonFriends AS (
SELECT f1.user1_id AS user1_id,
       f1.user2_id AS user2_id,
       f2.user2_id AS common
FROM Friendship f1, Friendship f2
WHERE f1.user2_id = f2.user1_id AND (f1.user1_id, f2.user2_id) IN (SELECT * FROM Friendship)
),

CommonFriendsAll AS (
SELECT *
FROM CommonFriends
UNION ALL
SELECT user1_id, common as user2_id, user2_id AS common
FROM CommonFriends
UNION ALL
SELECT user2_id, common AS user2_id, user1_id AS common
FROM CommonFriends
)

SELECT user1_id, user2_id, COUNT(DISTINCT common) AS common_friend
FROM CommonFriendsAll
GROUP BY user1_id, user2_id
HAVING COUNT(DISTINCT common) >= 3;