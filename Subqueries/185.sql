-- Write your MySQL query statement below
with
  EmployeesWithRankInDepartment as (
    select
      Department.name as department,
      Employee.name as employee,
      Employee.salary,
      dense_rank() over(
        partition by Employee.departmentId
        order by Employee.salary desc
      ) as `rank`
    from Department
    inner join Employee
      on (Department.id = Employee.departmentId )
  )
select
  department as Department,
  employee as Employee,
  salary as Salary
from EmployeesWithRankInDepartment
where `rank` <= 3;