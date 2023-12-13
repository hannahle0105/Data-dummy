--ex1
select name from city where population > 120000 and countrycode = 'USA';
--ex2
select * from city where countrycode = 'JPN';
--ex3
select city, state from station;
--ex4 (run bị lỗi ~ no response on stdout ~)
SELECT DISTINCT city FROM station
WHERE city LIKE 'a%'
   OR city LIKE 'e%'
   OR city LIKE 'i%'
   OR city LIKE 'o%'
   OR city LIKE 'u%';
-- ex4 (cách khác)
select distinct city from station where left(city,1) in ('a','e','i','o','u');
-- ex5
SELECT DISTINCT city FROM station
WHERE city LIKE '%a'
   OR city LIKE '%e'
   OR city LIKE '%i'
   OR city LIKE '%o'
   OR city LIKE '%u';
--ex6 (run ko được)
SELECT DISTINCT city FROM station
WHERE city NOT LIKE 'a%'
   AND city NOT LIKE 'e%'
   AND city NOT LIKE 'i%'
   AND city NOT LIKE 'o%'
   AND city NOT LIKE 'u%';
-- ex6 (cách khác)
SELECT DISTINCT city FROM station
WHERE NOT (city LIKE 'a%'
   OR city LIKE 'e%'
   OR city LIKE 'i%'
   OR city LIKE 'o%'
   OR city LIKE 'u%');
--ex7
select name from employee order by name;
--ex8
select name from employee where salary > 2000 and months < 10 order by employee_id;
--ex9
select product_id from products where low_fats = 'Y' and recyclable = 'Y';
--ex10
select name from customer where referee_id <>'2' or referee_id is null;
--ex11
select name, population, area from world 
where population >= 25000000
and area >= 300000;
--ex12
select distinct author_id as id from views where author_id = viewer_id order by id asc;
--ex13 
select part, assembly_step from parts_assembly where finish_date is null;
--ex14
select index from lyft_drivers where yearly_salary <=30000 or yearly_salary >= 70000;
--ex15
select advertising_channel from uber_advertising where money_spent > 100000 and year ='2019';



