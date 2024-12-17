-- Write your MySQL query statement below
delete P2
from Person as P1
inner join Person as P2
  on (P1.email = P2.email)
where P1.id < P2.id;