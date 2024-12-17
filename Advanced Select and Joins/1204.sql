-- Write your MySQL query statement below
with
  AccumulatedQueue as (
    select
      person_name,
      sum(weight) over(order by turn) as accumulated_weight
    from Queue
  )
select person_name
from AccumulatedQueue
where accumulated_weight <= 1000
order by accumulated_weight desc
limit 1;