-- Write your MySQL query statement below
select
  Products.product_name,
  sum(Orders.unit) as unit
from Products
inner join Orders
  using (product_id)
where date_format(Orders.order_date, '%Y-%m') = '2020-02'
group by product_id
having sum(Orders.unit) >= 100;