-- Create a Database for Retail Sales Analysis

create database retailsales;


-- Create table required for Analysis

use retailsales;

drop table if exists retail_sales;
create table retail_sales
						(
                            transactions_id	INT PRIMARY KEY,
                            sale_date DATE,
                            sale_time TIME, 	
                            customer_id	INT,
                            gender VARCHAR(20),
                            age	INT,
						    category VARCHAR(20),
				            quantiy	INT,
                            price_per_unit FLOAT,
                            cogs FLOAT,
                            total_sale FLOAT
                         );
                         
				
-- Check the table

select * from retail_sales;