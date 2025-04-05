create database sqlproject_1;

use sqlproject_1;

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );


select count(*) from retail_sales;


select* from retail_sales where sale_date is null;

select count(distinct customer_id)from retail_sales;

select distinct category from retail_sale;


-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT * FROM RETAIL_SALES 
WHERE CATEGORY = 'CLOTHING' AND ( COGS > 10
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30');
  
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
Select category , sum(total_sale)  from retail_sales
group by category
order by sum(total_sale);

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age), category from retail_sales
group by category
having category = 'beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale > '1000';

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
Select count(transaction_id), category, gender from retail_sales
group by category,gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
 SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
Select customer_id, sum(total_sale) as total_sales from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
USE SQLPROJECT_1;
select COUNT(DISTINCT Customer_id), category from RETAIL_SALES
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT count(transaction_id),
case
When sale_time <= '12:00:00' Then 'Morning'
when sale_time between '12:00:00' and '17:00:00' then 'afternoon'
else 'evening'
end as shift 
FROM RETAIL_SALES
group by shift;










