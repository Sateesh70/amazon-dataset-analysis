select * from amazon;
#1.What is the count of distinct cities in the dataset?
select count(distinct(city)) from amazon;
#2.For each branch, what is the corresponding city?
select distinct(branch) as corresponding_branch,city from amazon;
#3.What is the count of distinct product lines in the dataset?
select count(distinct(product_line)) as unique_product_lines from amazon;
#4.Which payment method occurs most frequently?
select payment ,count(*) as count_payment from amazon
group by payment
order by count_payment
desc;
#5.Which product line has the highest sales?
select product_line,max(total) as highest_sales from amazon group by Product_line
order by highest_sales
desc
limit 1;
#6.How much revenue is generated each month?
#6.How much revenue is generated each month?
select month(date)as year,year(date) as month,sum(total) as total_revenue
from amazon 
group by year(date),month(date)
order by year desc,month desc;
#7.In which month did the cost of goods sold reach its peak?
SELECT 
    EXTRACT(MONTH FROM date) AS month,
    SUM(cogs) AS total_cogs
FROM 
   amazon
GROUP BY 
    EXTRACT(MONTH FROM date)
ORDER BY 
    total_cogs DESC
LIMIT 1;
select extract(month from date) as month from amazon; 

#8.Which product line generated the highest revenue?
select product_line,max(total) as highest_revenue from amazon
group by Product_line
order by highest_revenue
limit 1;
#9.In which city was the highest revenue recorded?
select city,max(total) as highest_revenue from amazon
group by city
order by highest_revenue
limit 1;
#10.Which product line incurred the highest Value Added Tax?
select product_line,max(Tax5%) as highest_value_added_tax from amazon
group by product_line
order by  highest_value_added_tax
limit 1;
#11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT 
    product_line,
    total,
    CASE
        WHEN total > (SELECT AVG(total) FROM amazon) THEN 'Good'
        ELSE 'Bad'
    END AS sales_performance
FROM 
    amazon;

