-- Write your MySQL query statement below
with
  AllIds as (
    select requester_id as id from RequestAccepted
    union all
    select accepter_id from RequestAccepted
  )
select
  id,
  count(*) as num
from AllIds
group by 1
order by 2 desc
limit 1;