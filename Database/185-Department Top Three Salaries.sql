# Write your MySQL query statement below

SELECT Department, Employee, Salary
FROM 
(
    SELECT Department.name AS Department, Employee.name AS Employee, Salary,
    DENSE_RANK() OVER (PARTITION BY Department.name ORDER BY Salary DESC) AS RankSalary
    FROM Employee 
    INNER JOIN Department
    ON Employee.departmentId = Department.id
) Temp
WHERE Temp.RankSalary <= 3;