-- Write your MySQL query statement below
with
  CustomerToIsImmediate as(
    select
      distinct customer_id,
      first_value(order_date = customer_pref_delivery_date) over(
        partition by customer_id
        order by order_date
      ) is_immediate
    from Delivery
  )
select round(avg(is_immediate) * 100, 2) immediate_percentage
from CustomerToIsImmediate;