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
-- Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

	
	SELECT 
	SUM(total) as total_revenue
	FROM sales
	WHERE 
	YEAR(sale_date)  = 2023
	AND
	DATEPART(quarter,sale_date) = 4


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
