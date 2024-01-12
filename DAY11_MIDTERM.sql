--ex 1
select a.continent, floor(avg(b.population))
from COUNTRY as a
left join CITY as b
on a.Code=b.CountryCode
where b.population is not null
group by a.continent;

-- ex 2 -- ra kết quả = 1 @@
SELECT 
round(cast(count(t.signup_action)/count(distinct e.user_id) as numeric),2) as activation_rate
from emails as e
left join texts as t 
on e.email_id=t.email_id
where t.signup_action = 'Confirmed';

-- ex 3
SELECT
  a.age_bucket,
  round(100 * (sum(b.time_spent) filter (where b.activity_type = 'send') / sum(b.time_spent)), 2) as send_perc,
  round(100 * (sum(b.time_spent) filter (where b.activity_type = 'open') / sum(b.time_spent)), 2) as open_perc
FROM activities as b
inner join age_breakdown as a 
on a.user_id = b.user_id
group by a.age_bucket;

-- ex 4
SELECT a.customer_id
FROM customer_contracts as a
left join products as b 
on a.product_id=b.product_id
group by a.customer_id
having count(distinct product_category) = 3;

-- ex 5

-- ex 6
select p.product_name, sum(o.unit) as unit
from products as p 
left join orders as o 
on p.product_id=o.product_id
where o.order_date between '2020-02-01' and '2020-02-29'
group by p.product_name
having sum(o.unit) >= 100;
-- ex 7
SELECT p.page_id
FROM pages as p
left outer join page_likes as l
on p.page_id=l.page_id
where l.liked_date is null 
order by p.page_id;


-- MIDTERM TEST--
-- ex 1
select min(replacement_cost ) from film;

-- ex 2
select
case when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20.00 and 24.99 then 'mid' else 'high' 
end as category,
count (*) as number
from film
group by category;

-- ex 3
select f.title, f.length, c2.name
from film as f
left join film_category as c1 on f.film_id=c1.film_id
left join category as c2 on c1.category_id=c2.category_id
where name in ('Drama','Sports')
order by f.length desc;

-- ex 4
select c2.name, count(f.title ) as so_luong
from film as f
left join film_category as c1 on f.film_id=c1.film_id
left join category as c2 on c1.category_id=c2.category_id
group by c2.name
order by count(f.title )desc;

-- ex 5
select 
a.first_name ||' ' || a.last_name as full_name,
count (f.film_id) as so_luong
from actor as a
left join film_actor as f
on a.actor_id=f.actor_id
group by full_name
order by count (f.film_id) desc;

-- ex 6
select a.address_id, c.customer_id
from address as a
left outer join customer as c
on a.address_id=c.address_id
where c.customer_id is null;

-- ex 7 - chưa tìm thấy key join của 2 bảng city và payment
select ci.city, sum(p.amount) as doanh_thu
from customer as c 
left join address as a 
on c.address_id=a.address_id
left join payment as p
on c.customer_id=p.customer_id
left join city as ci
on a.city_id=ci.city_id
group by ci.city order by sum(p.amount) desc;

-- ex 8 -- đáp án bị nhầm lẫn (United States, Tallahassee : 50.85 là doanh thu thấp nhât)
select ci.city || ' ' || co.country as area, sum(p.amount) as doanh_thu
from customer as c 
left join address as a 
on c.address_id=a.address_id
left join payment as p
on c.customer_id=p.customer_id
left join city as ci
on a.city_id=ci.city_id
left join country as co
on ci.country_id=co.country_id
group by area order by sum(p.amount) desc;

