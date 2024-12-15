-- Write your MySQL query statement below
select Manager.name
from Employee
inner join Employee as Manager
on (Employee.managerId = Manager.id)
group by Manager.id
having count(*) >= 5;