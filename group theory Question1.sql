use atul;
Select * from sleep;

-- Q1 Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.


Select avg(`sleep efficiency`) from sleep
where `sleep duration` >=7.5 and gender = 'male'
order by `sleep duration` desc limit 15;

-- Q2 Show avg deep sleep time for both gender. Round result at 2 decimal places.
--     Note: sleep time and deep sleep percentage will give you, deep sleep time.
Select gender,round(avg(`sleep duration` *(`deep sleep percentage`/100)),2) as 'Deep_sleep_time'
from sleep
group by gender;

-- Q3 Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage 
--    values are between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.
Select age, `light sleep percentage`,`deep sleep percentage`
from sleep
where `deep sleep percentage` between 25 and 45
order by `light sleep percentage` ASC limit 10,30 ;

-- Q4 Group by on exercise frequency and smoking status and show average deep sleep time, average
--    light sleep time and avg rem sleep time.
--    Note the differences in deep sleep time for smoking and non smoking status

Select `Exercise frequency`,`Smoking status`,avg(`sleep duration` *(`deep sleep percentage`/100)),
avg(`sleep duration` *(`Light sleep percentage`/100)),
avg(`sleep duration` *(`rem sleep percentage`/100))
from sleep
group by `Exercise frequency`,`Smoking status`
order by avg(`sleep duration` *(`deep sleep percentage`/100)) DESC ;

-- Q5. Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol
--     consumption only for people who do exercise atleast 3 days a week. Show result in descending 
--     order awekenings
Select avg(`Caffeine consumption`),avg(`Alcohol consumption`),
avg(`sleep duration` *(`deep sleep percentage`/100))
from sleep
where `Exercise frequency`>=3
group by Awakenings
order by `Awakenings` DESC;

-- Q6. Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between
--     1000 and 2000 and the number of occurance of the power stations (also display these values) 
--     are greater than 200. Also sort the result in ascending order.
Select `Power Station`,avg(`Monitored Cap.(MW)`),
count(*)
from powerg
group by `Power Station`
having avg(`Monitored Cap.(MW)`) between 1000 and 2000 and count(*)>200;


-- Q7. Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021
--     and type is 'Public In-State'. Also the number of occurance should be between 6 to 10. Display
--     the average value upto 2 decimal places, state names and the occurance of the states.
Select state,round(avg(value),2),count(*) from nces
where year in (2013,2017,2021) and type = 'Public In-State' 
group by State
having count(*) between 6 and 10
order by avg(value) ASC limit 10;

-- Q8.  Best state in terms of low education cost (Tution Fees) in 'Public' type university.
Select State,avg(value) from nces
where type like '%public%' and Expense like '%Tuition%'
group by state
order by avg(Value) limit 1;

-- Q9. 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.
 Select State, avg(value) from nces
 where year=2021 and type like '%private%'
 group by state
 order by avg(value) DESC limit 1,1