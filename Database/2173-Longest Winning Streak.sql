# Write your MySQL query statement below

WITH MatchNum AS 
(SELECT player_id,
        match_day,
        result,
        (ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_day)) AS match_num
 FROM Matches),

WinNum AS 
(SELECT player_id,
        match_num,
        (ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_num)) AS win_num
 FROM MatchNum
 WHERE result = "Win"),

Streaks AS 
(SELECT player_id,
        (match_num - win_num) AS diff,
        COUNT(match_num - win_num) AS streak
FROM WinNum
GROUP BY player_id, diff)

SELECT player_id,
       MAX(streak) AS longest_streak
FROM Streaks
GROUP BY player_id
UNION
SELECT player_id,
       0 AS longest_streak
FROM Matches
WHERE player_id NOT IN (SELECT player_id FROM WinNum);