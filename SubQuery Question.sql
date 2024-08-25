-- Find the highest rated movie of 2000
use movies;

Select * from movies where year =2000 and score = (Select max(score) from movies where year = 2000);


#4. Find the highest rated movie among 
-- all movies whose number of votes are > the dataset avg votes     

Select * from movies where score = (select max(score) from movies ) and votes >
                                                                   (Select avg(votes) from movies);
                                                                   
#Find all the movies made by top 3 directors(in terms of total gross income)
with TOP_director AS(
Select director,sum(gross) from movies   
group by director
order by sum(gross) DESC limit 3         
)
select * from movies where director in (Select director from TOP_director);


-- Q6 Find all movies of all those actors whose filmography's avg rating > 8.5
-- (take 25000 votes as cutoff)


Select * from movies where star in (Select star from movies where votes > 25000 
                                       group by star
									   having avg(score) > 8.5 );                                       




                                                       