
use movies;
Select * from movies  where (year,gross-budget) in (Select year,max(gross-budget) from movies
                                                       group by year);
                          
                                         


