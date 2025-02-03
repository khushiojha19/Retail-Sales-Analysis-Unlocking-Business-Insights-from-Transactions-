-- Business Problem and Exploratory Data Analysis (EDA)

-- 01. Write a SQL query to retrieve all columns for sales made on '2022-11-05.

select *
from 
	retail_sales
where 
     sale_date = "2022-11-05";
     
     
-- 02. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.

select *
from
     retail_sales
where
     category = "Clothing" 
     and 
     quantiy >= 4
     and
     sale_date between "2022-11-01" and "2022-11-30";
     
     
-- 03. Write a SQL query to calculate the total sales (total_sale) for each category.

select category,
       sum(total_sale) as total_revenue,
       count(*) as total_orders
from retail_sales
group by category
order by total_revenue desc;


-- 04. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select category,
       customer_id,
       round(avg(age), 2) as avg_age
from 
    retail_sales
where
    category = "Beauty"
group by category, customer_id;


-- 05. Write a SQL query to find all transactions where the total_sale is greater than 1000.

select *
from
    retail_sales
where total_sale > 1000;


-- 06. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select gender,
       category,
       count(transactions_id) as transaction_count
from
    retail_sales
group by gender, category
order by transaction_count desc;


-- 07. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

with monthly_sales as (

select year(sale_date) as sale_year,
       month(sale_date) as sale_month,
       avg(total_sale) as avg_sales,
       rank() over(partition by year(sale_date) order by avg(total_sale) desc) as month_rank
from
    retail_sales
group by sale_year, sale_month)

select sale_year, 
       sale_month, 
       avg_sales
from 
     monthly_sales
where month_rank = 1
order by sale_year;


-- 08. Write a SQL query to find the top 5 customers based on the highest total sales.

with rank_customer as (
select customer_id, 
       sum(total_sale) as total_sales,
       rank() over(order by sum(total_sale) desc) as cust_rank
from 
    retail_sales
group by customer_id )

select customer_id,
       total_sales
from rank_customer
where cust_rank <= 5
order by total_sales desc;


-- 09. Write a SQL query to find the number of unique customers who purchased items from each category.

select count(distinct customer_id) as unique_customer,
       category,
       total_sale
from
    retail_sales
group by category, total_sale;


-- 10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17).

with order_shift as (
select *,
case
    when hour(sale_time) < 12 then "Morning"
    when hour(sale_time) between 12 and 17 then "Afternoon"
    when hour(sale_time) > 17 then "Evening"
    end as "shift"
from
    retail_sales )
    
select count(*) as total_orders,
       shift
from 
    order_shift
group by shift;






       

     
     
     
