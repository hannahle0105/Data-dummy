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

