-- Write your MySQL query statement below
with
  Players as (
    select player_id, min(event_date) as first_login
    from Activity
    group by 1
  )
SELECT round(
    count(Players.player_id) / (
      select count(distinct Activity.player_id)
      from Activity
    ),
    2
  ) as fraction
from Players
inner join Activity
  on (
    Players.player_id = Activity.player_id
    and DATEDIFF(Players.first_login, Activity.event_date) = -1
)