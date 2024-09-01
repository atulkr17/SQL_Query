SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

use sql_task;
-- Q1. Find out top 10 countries' which have maximum A and D values.
Select A.country,A,D from (select country,A from country_ab order by A desc limit 10) A
left join 
(select country,D from country_cd order by D desc limit 10)B
ON A.country=B.country
union 
Select B.country,A,D from (select country,A from country_ab order by A desc limit 10) A
right join 
(select country,D from country_cd order by D desc limit 10)B
on A.country=B.country
order by country;

--  Q2. Find out highest CL value for 2020 for every region. Also sort the result in 
--      descending order. Also display the CL values in descending order.
Select t1.country,Region,Max(CL) from country_cl t1
join 
country_ab t2
on t1.country=t2.country
where t1.Edition=2020
group by Region
order by max(CL) DESC;

-- Q3. Find top-5 most sold products
SELECT name, sum(Quantity) as 'total_Quentity'  FROM sql_task.products t1
join sales1 t2
on t1.ProductID = t2.ProductID
group by t1.ProductID
order by total_Quentity DESC limit 5;

-- Q4.  Find sales man who sold most no of products.
Select t2.salespersonID ,t1.firstName,t1.lastname ,
sum(Quantity) as 'total_quentity'
from Employees t1
join sales1 t2
on t1.EmployeeID = t2.salespersonID
group by SalespersonID 
order by total_quentity DESC;

-- Q5. Sales man name who has most no of unique customer.
Select t2.salespersonID ,t1.firstName,t1.lastname ,
count(distinct customerID) as 'Unique_Data'
from Employees t1
join sales1 t2
on t1.EmployeeID = t2.salespersonID
group by SalespersonID 
order by 'Unique_Data'  DESC;

--  Q6. Sales man who has generated most revenue. Show top 5
Select t1.salesID, t3.FirstName,t3.lastName,sum(t1.Quantity * price) as "Total_sum" 
from sales1 t1
join products t2
on t1.productID=t2.productID
join Employees t3 
ON t1.salesPersonID =t3.EmployeeID
Group by t1.salesPersonID
order by "Total_sum" limit 5

-- Q7. List all customers who have made more than 10 purchases.





