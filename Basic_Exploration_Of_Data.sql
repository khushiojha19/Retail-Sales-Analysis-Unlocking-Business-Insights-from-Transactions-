use retailsales;

-- Perform basic exploration of data

-- Count the rows 

select
      count(*)
from retail_sales;


-- Check if there are any null values in each column of your table

select * from retail_sales
where 
     transactions_id is null
     or
     sale_date is null
     or
     sale_time is null
     or
     customer_id is null
     or
     gender is null
     or
     age is null
     or
     category is null
     or
     price_per_unit is null
     or
     quantiy is null
     or
     cogs is null
     or
     total_sale is null;
     
     
-- How many sales do we have?

select 
     count(*) as total_sales
from retail_sales;


-- How many unique customers do we have?

select
     count(distinct customer_id) as total_customer
from retail_sales;


-- How many categories do we have?

select
     distinct category as category
from retail_sales;








