#Q1. select a particular database
USE Zomato;

#Q2. count number of rows
Select count(*) from order_details;

#Q3. return n random records
Select * from users order by rand() limit 5;

#QI 4. Find null values
Select * from orders where restaurant_rating is null;

#Q5. find the number of orders placed by each customer
SELECT t1.name,count(*) from users t1
join orders t2
on t1.user_id=t2.user_id
group by t1.user_id,t1.name;

#Q6. find restaurant with most number of menu items
Select t1.r_name,count(*) from restaurants t1
join menu t2
on t1.r_id=t2.r_id
group by t1.r_id,r_name;

#Q7. find number of votes and avg rating for all the restaurants
SELECT r_name,count(*) as 'voats',round(avg(restaurant_rating),2) as 'rating' from orders t1
join restaurants t2
on t1.r_id= t2.r_id
where restaurant_rating is not null
group by r_name;


#Q8. find the food that is being sold at most number of restaurants
Select t2.f_name,count(*) from menu t1
join food t2
on t1.f_id=t2.f_id
group by t1.f_id,t2.f_name
order by count(*) DESC limit 1;

#Q9. find restaurant with max revenue in a given month
Select r_name,sum(amount) as'revenue' from restaurants t1
join orders t2
on t1.r_id=t2.r_id
where monthname((date(date))) ='may'
group by t1.r_id,r_name
order by sum(amount) DESC;

# month by month revenue for a particular month
Select monthname(date(date)),sum(amount) as 'revenue'
from restaurants t1
join orders t2
on t1.r_id=t2.r_id
where r_name ='kfc'
group by monthname(date(date))
order by month(date(date));


#Q10. find restaurants with sales > x
Select t1.r_name,sum(amount) from restaurants t1
join orders t2
on t1.r_id=t2.r_id
group by r_name
having sum(amount)>1500;

#Q11. find customers who have never ordered
select user_id ,name from users
Except
select t1.user_id,name from orders t1
join users t2
on t1.user_id=t2.user_id;

#Q12. Show order details of a particular customer in a given date range
select t4.name,t3.f_name,t1.order_id,t1.date from orders t1
join order_details t2
on t1.order_id=t2.order_id
join food t3
on t2.f_id = t3.f_id
join users t4
on t1.user_id=t4.user_id
where t1.user_id=1 and date between '2022-05-01' and '2022-06-01';

#Q13. Customer favorite food


#Q14. find most costly restaurants(Avg price/dish)
Select t2.r_name,sum(price)/count(*) as 'Avgrevenue'from menu t1
join restaurants t2
on t1.r_id=t2.r_id
group by t1.r_id,t2.r_name
order by Avgrevenue DESC limit 1;


#Q15. find delivery partner compensation using the formula (#deliveries * 100 + 1000*avg_rating)
Select t2.partner_name,t1.partner_id,count(*)*100+avg(delivery_rating)*1000 as 'Salary' from orders t1
join delivery_partner t2
on t1.partner_id=t2.partner_id
group by t1.partner_id,t2.partner_name;

#Q16. find revenue per month for a restaurant
Select monthname(date(date)),sum(amount) as 'revenue'
from restaurants t1
join orders t2
on t1.r_id=t2.r_id
where r_name ='kfc'
group by monthname(date(date));


-- Q17. find correlation between delivery time and total rating
-- 18. find corr between #orders and avg price for all restautants

-- Q19. find all the veg restaurants
Select * from menu t1
join food t2
on t1.f_id=t2.f_id
group by 


