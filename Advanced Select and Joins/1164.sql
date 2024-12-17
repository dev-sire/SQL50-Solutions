-- Write your MySQL query statement below
with
  RankedProducts as (
    select
      product_id,
      new_price,
      rank() over(
        partition by product_id
        order by change_date desc
      ) as `rank`
    from Products
    where change_date <= '2019-08-16'
  ),
  ProductToLatestPrice as (
    select product_id, new_price
    from RankedProducts
    where `rank` = 1
  )
select
  Products.product_id,
  ifnull(ProductToLatestPrice.new_price, 10) as price
from Products
left join ProductToLatestPrice
  using (product_id)
group by Products.product_id;