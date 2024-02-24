# Write your MySQL query statement below

WITH ranking AS (
SELECT id, company, salary,
RANK() OVER(PARTITION BY company ORDER BY salary, id) AS rank_s
FROM Employee
),

counts AS (
SELECT company, COUNT(*) AS count_for_co
FROM Employee
GROUP BY company
)

SELECT id, company, salary
FROM ranking
INNER JOIN counts
USING (company)
WHERE (count_for_co % 2 = 0 AND rank_s IN (count_for_co / 2, count_For_co / 2 + 1))
OR (count_for_co % 2 = 1 AND rank_s = CEIL(count_for_co / 2))