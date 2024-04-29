create database retailsales;
use retailsales;
select * from retailsales;
select transaction_id,total_amount,priceperunit from retailsales;
-- 1 What is the total sales amount for each product category.
select product_category,sum(total_amount)as totalsalesamt from retailsales group by product_category;
-- insights: 
-- 1 identifying top-selling product categories: By analyzing the total sales amount for each product category,

--  we can pinpoint which categories contribute the most to overall revenue.
-- 2 optimizing inventory and stock management: Knowing the total sales amount for each product category allows businesses to optimize inventory levels. 

-- 2 What is the average age of customers by gender.
select avg(age)as avg_age ,gender from retailsales group by gender;
-- insights:
-- 1. Understanding demographic preferences: By calculating the average age of customers by gender, businesses can gain insights into the age distribution 
-- within their customer base segmented by gender. 
-- This information helps in understanding the demographic preferences of different customer groups and tailoring marketing strategies accordingly.

-- 3 . select product category and max price per unit of product category 
select product_category,max(priceperunit)asmax_price from retailsales group by product_category;
-- insights:
-- 1. identifying premium product categories: By selecting the maximum price per unit for each product category, 
-- we can identify which categories have the highest-priced items. 
-- This insight helps in understanding the market positioning of different product categories and identifying premium or luxury segments within the product range.
-- 2. opportunities for pricing optimization: Knowing the maximum price per unit within 
-- each category allows businesses to assess whether their pricing strategy aligns with market demand and competition.
--  It provides insights into potential opportunities for price adjustments or introducing higher-priced variants
--  within certain categories to maximize revenue and profitability.

-- 4."find the total sales amount for each customer, grouped by their gender. Additionally,  to find the average age of customers who made purchases, grouped by gender.
SELECT gender,SUM(total_amount) AS total_sales_amount,AVG(age) AS average_age FROM (SELECT customer_id,gender,SUM(priceperunit * quantity) AS total_amount,AVG(age) AS age FROM retailsales GROUP BY customer_id, gender) AS subquery GROUP BY gender;
-- insights:
-- 1.Customer Segmentation Opportunities:By combining sales data with demographic information such as gender and age, businesses can 
-- create customer segments for targeted marketing and personalized experiences.
-- Understanding which gender and age groups contribute the most to sales can inform decisions related 
-- to product development, pricing strategies, and promotional activities aimed at specific customer segments.

-- 5  Who are the top 5 customers based on total amount spent
select customer_id ,sum(total_amount)as sumamt from retailsales group by customer_id  order by sumamt desc limit 5 ;
-- insights:
-- 1. Identifying Top Spenders: This query reveals the top 5 customers who have spent the highest total amount,
--  providing insights into the most valuable customers for the business.
-- 2.Understanding Customer Spending Patterns: By summing total amounts per customer, businesses gain insight 
-- into individual customer spending behaviors, facilitating targeted marketing and personalized customer engagement strategies.

-- 6 Count the number of transactions made by each customer.
select customer_id,count(transaction_id) from retailsales group by customer_id;
-- insights:
-- 1.Customer Engagement Analysis: By counting transactions per customer, businesses gain insight
-- s into customer engagement levels, enabling targeted marketing efforts and personalized customer experiences.

-- 7 select customer_id,transaction_id,totalamount from table for customer_id=cust001
select customer_id,transaction_id,total_amount from retailsales where customer_id = "cust001";
-- insights:
-- We can calculate the total amount spent by "cust001" across all transactions. 
-- This insight helps understand their overall purchasing power and contribution to revenue.

-- 8 write a query to show the average price per unit of each product category.
select product_category,avg(priceperunit) from retailsales group by product_category;
-- insights:
-- Product Category Pricing Analysis: This query provides insight into the average price per unit for each product category, 
-- allowing businesses to understand pricing trends across different product categories.

-- 9 What is the product category that has the highest total quantity sold?
select product_category,sum(quantity) as total_quantity from retailsales group by product_category order by total_quantity desc limit 1;
-- insights:
-- Demand Analysis: By determining the top-selling product category,
--  businesses gain insights into customer preferences and demand patterns.
-- This information can inform pricing strategies, promotional campaigns, and 
-- product development initiatives aimed at meeting customer needs and driving sales growth.

-- 10 How many distinct customers are there in the dataset, broken down by gender?
select gender,count(distinct customer_id ) as distinctcustomer from retailsales group by gender;
-- insights:
-- Customer Diversity Analysis: By breaking down the count of distinct customers by gender, this query provides insight 
-- into the diversity of the customer base. Understanding the distribution of customers across genders helps businesses tailor marketing strategies and
--  product offerings to better cater to the needs and preferences of different demographic segments.

-- 11 Calculate the total sales amount for each product category, where the total amount is greater than  any the average total amount across all categories.
select product_category,total_amount from retailsales  where total_amount>any (select avg(total_amount) from retailsales group by product_category);
-- insights:
 -- By comparing each category's total sales amount to the average across all categories,
--  businesses can pinpoint high-performing categories deserving of focused marketing efforts or additional resources.

-- 12 calculate the avg total amount of sales and age group between 25 to 35 of each product category and age .
select product_category,age, avg(total_amount)from retailsales where age between 25 and 35 group by product_category,age;
 -- insights:
-- Calculating the average total amount of sales and age group between 25 to 35 for each product category helps 
-- identify the spending patterns of this demographic, aiding in targeted marketing strategies and product development catering to their preferences.

