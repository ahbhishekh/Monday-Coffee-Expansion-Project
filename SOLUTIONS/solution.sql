SELECT * FROM city;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM sales;

-- Reports & Data Analysis

-- Q.1 Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
SELECT 
city_name,
ROUND((population*0.25)/1000000,2) as Coffee_Consumers_in_Million,
city_rank
FROM CITY 
ORDER BY 2 DESC

-- -- Q.2
-- A.Total Revenue from Coffee Sales
-- B.What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

--A
SELECT 
SUM(total) as total_revenue
FROM sales
WHERE 
	YEAR(sale_date)  = 2023
	AND
	DATEPART(quarter,sale_date) = 4

--B
SELECT
ci.city_name,
SUM(s.TOTAL) AS TOTAL_REVENUE
FROM SALES as s
LEFT JOIN customers AS C
	ON c.customer_id = s.customer_id
LEFT JOIN city as ci
	on ci.city_id=c.city_id
WHERE
	YEAR(SALE_DATE)=2023
	AND

	DATEPART(QUARTER,SALE_DATE)=4
GROUP BY ci.city_name
ORDER BY SUM(s.TOTAL)


-- Q.3
-- Sales Count for Each Product
-- How many units of each coffee product have been sold?
SELECT 
p.product_name,
COUNT(s.sale_id) as total_orders
FROM products as p
LEFT JOIN sales AS s
ON p.product_id=s.product_id
GROUP BY p.product_name
order by COUNT(s.sale_id)

-- Q.4
-- Average Sales Amount per City
-- What is the average sales amount per customer in each city?
-- city abd total sale
-- no cx in each these city
select  
ci.city_name,
sum(s.total) as total_sales,
count(distinct s.customer_id) as total_customers,
cast(round(cast(sum(s.total) as decimal(18,2))/count(distinct s.customer_id),2)as decimal (18,2)) as avg_price
from sales as s
join customers as c
on s.customer_id=c.customer_id
join city as ci
on ci.city_id=c.city_id
group by ci.city_name
order by total_sales



