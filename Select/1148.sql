-- Write your MySQL query statement below
select distinct author_id as Id 
from Views
where author_id = viewer_id
order by 1;