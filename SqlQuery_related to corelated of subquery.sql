SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
use zomato;

-- Q Find the favorite food of each customer.
with fav_food as (
Select t2.user_id,t1.name,t4.f_name, count(*) as 'frequency'from users t1
join orders t2 on t1.user_id= t2.user_id
join order_details t3 on t2.order_id=t3.order_id
join food t4 on t3.f_id=t4.f_id
group by t2.user_id,t3.f_id
ORDER BY name
)
Select * from fav_food m1 where frequency =(Select max(frequency) 
										   from fav_food m2
                                           where m2.user_id=m1.user_id); 
                                           
-- Q Get the percentage of votes for each movie compared to the 
--   total number of votes.           
Select name,votes/(Select sum(votes) from movies) from movies;

-- Q Display all movie names ,genre, score and avg(score) of genre   
Select name,genre,score,(Select avg(score) from movies m2 where m2.genre=m1.genre) from movies m1 ;                            
                                           
-- Q. Display average rating of all the restaurants
Select r_id,avg(restaurat_rating) from orders

