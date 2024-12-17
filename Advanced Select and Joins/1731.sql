-- Write your MySQL query statement below
select
  Manager.employee_id,
  Manager.name,
  count(Employee.employee_id) as reports_count,
  round(avg(Employee.age)) as average_age
from Employees as Manager
inner join Employees as Employee
  on (Employee.reports_to = Manager.employee_id)
group by Manager.employee_id
order by Manager.employee_id;