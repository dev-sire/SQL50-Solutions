-- Write your MySQL query statement below
with
  Dates as (
    select distinct visited_on
    from Customer
    where visited_on >= (
      select DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
      from Customer
    )
  )
select
  Dates.visited_on,
  sum(Customer.amount) as amount,
  round(sum(Customer.amount) / 7, 2) as average_amount
from Dates
left join Customer
    on (datediff(Dates.visited_on, Customer.visited_on) between 0 and 6)
group by Dates.Visited_on;