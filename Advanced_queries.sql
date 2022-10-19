
--Q1 Country that bought the most product
select country, count(product) as total_products
from review
group by country
order by total_products DESC;

-- Q2 Most bought products and the country 
select country,product, count(product) as total_phones
from review
GROUP BY country,product
ORDER BY total_phones DESC;

-- Q3 Most bought products in US and source 
select country,product, count(product) as total_phones,source
from review
Where country = 'us'
GROUP BY country,product,source
ORDER BY total_phones DESC;

--Q4 The highest scored products
select product, count(score) as score
from review
group by product
order by score desc;

--Q5 The most bought samsung product by coutry and source
select product,country,source,count(product) as count
from review
Where product like 'Samsung%'
group by country,source,product
order by count desc;