-- Write your MySQL query statement below
(
  select Users.name as results
  from MovieRating
  inner join Users
    using (user_id)
  group by user_id
  order by count(MovieRating.movie_id) desc, Users.name
  limit 1
)
union all
(
  select Movies.title as results
  from MovieRating
  inner join Movies
    using (movie_id)
  where DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
  group by movie_id
  order by AVG(MovieRating.rating) desc, Movies.title
  limit 1
);