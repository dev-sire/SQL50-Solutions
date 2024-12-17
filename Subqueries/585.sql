-- Write your MySQL query statement below
with
  InsuranceWithCounts as (
    select
      tiv_2016,
      count(*) over(partition by tiv_2015) as tiv_2015_count,
      COUNT(*) OVER(partition by lat, lon) as city_count
    from Insurance
  )
select round(sum(tiv_2016), 2) as tiv_2016
from InsuranceWithCounts
where tiv_2015_count > 1
  and city_count = 1;