# Write your MySQL query statement below

SELECT DISTINCT emp_id,
                firstname,
                lastname,
                MAX(salary) OVER (PARTITION BY emp_id) AS salary,
                department_id 
FROM Salary
ORDER BY emp_id ASC;