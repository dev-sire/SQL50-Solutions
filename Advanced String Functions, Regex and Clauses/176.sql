-- Write your MySQL query statement below
with
  RankedEmployees as (
    select *, dense_rank() over(order by salary desc) as `rank`
    from Employee
  )
select max(salary) as SecondHighestSalary
from RankedEmployees
where `rank` = 2;