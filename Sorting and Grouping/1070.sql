-- Write your MySQL query statement below
with
  ProductToYear as (
    select product_id, min(year) as year
    from Sales
    group by 1
  )
select
  Sales.product_id,
  ProductToYear.year as first_year,
  Sales.quantity,
  Sales.price
from Sales
inner join ProductToYear
  using (product_id, year);