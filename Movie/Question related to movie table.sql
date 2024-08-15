use movies;
#1. Find the movie with highest profit(vs order by)
Select * from movies.movies where (budget-gross) =
                                   (Select max(budget-gross) from movies.movies);

Select * from movies order by (budget-gross) Desc limit 1;
#2. Find how many movies have a rating > the avg of all the movie ratings 
--   (Find the count of above average movies)

Select count(*) from movies where score > (select avg(score) from movies.movies);


#3. Find the highest rated movie of 2000
select * from movies.movies where year=2000 and score=(Select max(score) from 
                                          movies where year = 2000 );
                                          
 #4. Find the highest rated movie among all movies whose number of votes are > the dataset avg votes                                         
select * from movies where score=(select max(score) from movies where votes > 
                                   (Select avg(votes) 
                                    from movies ));
                                    
#Q5 Find all the movies made by top 3 directors(in terms of total gross income)                                   
with top_director as (Select director,sum(gross) from movies  
						group by director 
						order by sum(gross) DESC limit 3 )
                     
Select * from movies
where director in (Select director from top_director);



-- Q6 Find all movies of all those actors whose filmography's avg rating > 8.5
-- (take 25000 votes as cutoff)
Select * from movies where star IN (Select star from movies where votes > 25000
                                     group by star
									 having avg(score) > 8.5);
                                     
#Q7. Find the most profitabile movie of each year                                     
Select * from movies where (year,gross-budget) in (Select year,max(gross-budget) from movies
                                                       group by year);
                                                       
#Q8. Find the highest rated movie of each genre votes cutoff of 25000                                                       
Select * from movies where (genre,score) in (Select genre,max(score) from movies 
                                              where votes > 25000 
											  group by genre) 
and votes>25000;     

#9. Find the highest grossing movies of top 5 actor/director combo in terms of total gross income
WITH Top_movie AS (
Select director,star,max(gross) as 'max_gross' from movies 
						group by director,star
						order by sum(gross) DESC limit 5
)
                        
Select * from movies where (director,star,gross)=(Select director,star,max_gross from Top_movie);   

-- Q. Find all the movies that have a rating higher than the average rating 
--    of movies in the same genre.[Animation]           

Select * from movies m1 where score > (Select avg(score)
                                       from movies m2 where m2.genre=m1.genre)




                                         
                                                      

                                  


                                     

                           
 
                                    