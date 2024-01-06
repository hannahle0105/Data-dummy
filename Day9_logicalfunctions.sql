-- challenge
select 
case 
when extract(month from scheduled_departure) in (1, 2, 3) then 'xuan' -- trong in ko có ''
when extract(month from scheduled_departure) in (4, 5, 6) then 'he'
when extract(month from scheduled_departure) in (7, 8, 9) then 'thu'
else 'dong'
end as mua, -- thiếu as
count (*)
from flights
group by mua;

-- ex 1
select 
count(case when device_type like 'laptop' then 'laptop_views' end) as laptop_views,
count(case when device_type in ('tablet','phone') then 'mobile_views' end) as mobile_views
from viewership; 
-- ex 2
select x,y,z,
case
when (x + y) > z and (x + z) > y and (z + y) > x then 'Yes'
else 'No'
end as triangle
from Triangle;
-- ex 3
select 
round(100*
(sum(case when call_category = 'n/a' or call_category is null then 1 else 0 end))/count(case_id)) as call_percentage
from callers;
-- ex 4
select name 
from customer 
where referee_id <> 2 or referee_id is null;
-- ex 5
select 
survived,
sum(case when pclass = 1 then 1 else 0 end) as first_class,
sum(case when pclass = 2 then 1 else 0 end) as second_class,
sum(case when pclass = 3 then 1 else 0 end) as third_class
from titanic
group by survived;
