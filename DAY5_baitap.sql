--ex1
select distinct city from station where id%2=0;
--ex 2
select count(city) - count(distinct city) from station;
--ex 3
select ceiling (avg(salary) - avg((replace(salary, '0', '')))) from employees;

--ex 4
select sum(item_count*order_occurrences)/sum(order_occurrences) from items_per_order;
--ex 4 - SỬA
select
round(cast(sum(item_count*order_occurrences)/sum(order_occurrences)) as decimal),1) as mean
from items_per_order;

--ex 5
SELECT candidate_id FROM candidates
where skill in ('Python','Tableau','PostgreSQL')
order by candidate_id asc;
--ex 5 - SỬA 
SELECT candidate_id FROM candidates
where skill in ('Python','Tableau','PostgreSQL')
group by candidate_id
having count(skill) = 3;

--ex 6
SELECT user_id,
max(date(post_date))-min(date(post_date)) as days
FROM posts
where post_date between '2021-01-01'and '2022-01-01'
group by user_id
having count(post_id)>=2;
-- ex 7
SELECT card_name,
max(issued_amount)-min(issued_amount) as difference
FROM monthly_cards_issued
group by card_name 
order by card_name desc;

--ex 8
select manufacturer,
count(drug) as drug_count
abs(total_sales-cogs) as total_loss
from pharmacy_sales
group by manufacturer where total_sales<cogs -- where trước group by
order by total_loss;
--ex 8 SỬA
select manufacturer,
count(drug) as drug_count,
abs(sum(total_sales-cogs)) as total_loss -- /tại sao phải có hàm sum ở đây mà không dùng thẳng dấu '-'/
from pharmacy_sales
where total_sales<cogs
group by manufacturer
order by total_loss desc;

--ex 9
select id, movie, description, rating from Cinema
where not id%2=0 and description not like 'boring'
order by rating desc;
--ex 10
select teacher_id,
count(distinct subject_id) as cnt
from Teacher
group by teacher_id;
--ex 11
select user_id,
count(follower_id) as followers_count
from Followers
group by user_id 
order by user_id;
--ex 12
select class from Courses
group by class having count(student)>=5;
