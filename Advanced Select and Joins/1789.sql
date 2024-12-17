-- Write your MySQL query statement below
select
  employee_id,
  department_id
from Employee
where primary_flag = 'Y'
union distinct
select
  employee_id,
  department_id
from Employee
group by 1
having count(*) = 1;