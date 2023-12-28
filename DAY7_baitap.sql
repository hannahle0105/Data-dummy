--ex 1
--If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID? --> thêm ID
select name from students 
where marks > 75
order by right(name,3), ID
-- ex 2
select user_id,
upper(left(name,1)) || lower(right(name,length(name)-1)) as name -- substring(name,2 ) -- trích xuất tất cả ký từ từ ký tự thứ 2
from users;
-- ex 3
select
manufacturer,
'$'||round((sum(total_sales)/1000000,0))||' '||'million'
from pharmacy_sales
group by manufacturer
order by sum(total_sales) decs, manufacturer 
--ex 4
SELECT extract (month from submit_date) as mth,
product_id, 
round(avg(stars),2) as avg_stars
FROM reviews
group by mth, product_id
order by mth, product_id;
--ex 5 
SELECT sender_id,
count(message_id) as message_count 
FROM messages
where extract(month from sent_date) =8 and extract(year from sent_date)=2022
group by sender_id
order by message_count desc;
-- ex 6
select tweet_id from Tweets
where length(content) >15;
--ex 7
select activity_date as day, 
count(distinct user_id) as active_users from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by day;
--ex 8
select 
count(id) from employees
where joining_date between '2022-01-01' and '2022-07-31';
--ex 9
SELECT first_name, 
       POSITION('a' IN first_name) AS position_of_a
FROM worker
WHERE first_name LIKE 'Amitah';

-- ex 10
select winery,
extract(year from title)
from winemag_p2
where country = 'Macedonia';
-- ex 10 - answer
select substring(title, length(winery)+2, 4) -- +2 dấu cách
from winemag_p2
where country = 'Macedonia';
