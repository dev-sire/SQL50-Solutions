-- Write your MySQL query statement below
select
  Signups.user_id,
  ifnull(round(avg(Confirmations.action = 'confirmed'), 2), 0) as confirmation_rate
from Signups
left join Confirmations
  using (user_id)
group by Signups.user_id;