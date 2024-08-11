#Q1.  Find out top 10 countries' which have maximum A and D values.
select A.Country,A,D from (SELECT * from sql_task.country_ab
order by a Desc) A
LEFT join 
(Select Country,D from sql_task.country_cd
order by d DESC limit 10) B
ON A.country=B.country
union
select B.country ,A,D from (SELECT * from sql_task.country_ab
order by A Desc limit 10) A
RIGHT JOIN
(Select country,D from sql_task.country_cd
order by d DESC) B
ON A.country=B.country ;


#Q2--Find out highest CL value for 2020 for every region.Also sort the result in
#  customers-- descending order. Also display the CL values in descending order.
Select Region,max(cl) from sql_task.country_cl t1
JOIN sql_task.country_cd t2
where t1.Edition='2020'
group by Region
ORDER BY max(cl);


#Q3--Find top-5 most sold products.
SELECT name,SUM(Quantity) FROM sql_task.sales1 t1
JOIN sql_task.products t2
ON t1.ProductID = t2.ProductID
GROUP BY name
ORDER BY SUM(Quantity) DESC;

#Q4--Find sales man who sold most no of products.
SELECT t1.SalesPersonID,LastName,SUM(Quantity)
FROM sql_task.sales1 t1
JOIN sql_task.employees t2
ON t1.SalesPersonID=t2.EmployeeID
group by ProductID,FirstName,LastName,t1.SalesPersonID
order by SUM(Quantity) DESC;

#Q5--Sales man name who has most no of unique customer.

SELECT t1.SalesPersonID,FirstName,LastName,count(DISTINCT(CustomerID))
FROM sql_task.sales1 t1
JOIN sql_task.employees t2
ON t1.SalesPersonID=t2.EmployeeID
group by t1.SalesPersonID,LastName,FirstNamez
order by count(DISTINCT(CustomerID)) DESC;


#Q6--Sales man who has generated most revenue. Show top 5.

Select t1.SalesPersonID,t3.FirstName,t3.LastName,
round(sum(t1.Quantity*t2.Price)) as 'total_revenue'
from sql_task.sales1 t1
join sql_task.products t2
on t1.ProductID=t2.ProductID
join sql_task.employees t3
on t1.SalesPersonID=t3.EmployeeID
group BY t1.SalesPersonID,t3.FirstName,t3.LastName
order by total_revenue DESC limit 5;

#Q7--List all customers who have made more than 10 purchases.

Select t1.CustomerID,t2.FirstName,t2.LastName,count(*) 
from sql_task.sales1 t1
join sql_task.customers t2
on t1.CustomerID=t2.CustomerID
group by t1.CustomerID ,t2.FirstName,t2.LastName
having count(*)>10
order by count(*) DESC;

#Q8-- List all salespeople who have made sales to more than 5 customers.
SELECT t1.SalesPersonID,FirstName,LastName,count(DISTINCT(CustomerID))
FROM sql_task.sales1 t1
JOIN sql_task.employees t2
ON t1.SalesPersonID=t2.EmployeeID
group by t1.SalesPersonID,LastName,FirstName
having count(DISTINCT(CustomerID))>5;



 #Q9--List all pairs of customers who have made purchases with 
#   --the same salesperson.
SELECT distinct t1.CustomerID as 'first customer'
, t2.CustomerID as 'second customer',
t1.SalesPersonID
from sql_task.sales1 t1
join sql_task.sales1 t2
on t1.SalesPersonID = t2.SalesPersonID
and t1.CustomerID != t2.CustomerID