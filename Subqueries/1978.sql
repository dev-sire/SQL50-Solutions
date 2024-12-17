-- Write your MySQL query statement below
select Employee.employee_id
from Employees as Employee
left join Employees as Manager
  on (Employee.manager_id = Manager.employee_id)
where
  Employee.salary < 30000
  and Employee.manager_id is not null
  and Manager.employee_id is null
order by 1;