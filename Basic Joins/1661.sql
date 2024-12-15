-- Write your MySQL query statement below
select
  StartActivity.machine_id,
  round(
    avg(EndActivity.timestamp - StartActivity.timestamp),
    3
  ) as processing_time
from Activity as StartActivity
inner join Activity as EndActivity
  using (machine_id, process_id)
where
  StartActivity.activity_type = 'start'
  and EndActivity.activity_type = 'end'
group by 1;