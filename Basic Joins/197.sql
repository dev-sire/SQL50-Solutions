-- Write your MySQL query statement below
select Today.id
from Weather as Today
inner join Weather as Yesterday
on (date_sub(Today.recordDate, interval 1 day) = yesterday.recordDate)
where Today.temperature > Yesterday.temperature;