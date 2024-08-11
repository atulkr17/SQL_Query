#Q1 ---Find out the average sleep duration of top 15 male candidates who's sleep duration
#  --- are equal to 7.5 or greater than 7.5.

SELECT avg(`Sleep duration`) FROM atul.sleep
where `sleep duration` > 7.5 and Gender ='male'
order by `sleep duration` desc limit 15;

/*
Q2--Show avg deep sleep time for both gender. Round result at
  --2 decimal places.
 --Note: sleep time and deep sleep percentage will give you, deep sleep time.
*/
select gender,avg(`Sleep duration`*(`Deep sleep percentage`/100)) 
as 'avg_deep_sleep'
from atul.sleep
group by gender;

#Q3
/*--Find out the lowest 10th to 30th light sleep percentage
 ----records where deep sleep percentage values are between 25 to 45.
 ----Display age, light sleep percentage and deep sleep
 ----percentage columns only.*/
 
 Select age,`Light sleep percentage`,`Deep sleep percentage` from atul.sleep
 where `deep sleep percentage` between 25 and 45
 order by `Light sleep percentage` ASC LIMIT 10,30;
 
#Q4   --Group by on exercise frequency and smoking status and
#     --show average deep sleep time,
#     --average light sleep time and avg rem sleep time.
#     --Note the differences in deep sleep time for smoking and non smoking status

 Select `Exercise frequency`,`Smoking status`,
 avg(`Sleep duration`*(`Deep sleep percentage`/100))  as 'avg_Dsleep_time',
 avg(`Sleep duration`*(`light sleep percentage`/100))  as 'avg_Lsleep_time',
 avg(`Sleep duration`*(`rem sleep percentage`/100))  as 'avg_ram_sleepTime'
 from atul.sleep
 group by `Exercise frequency`,`Smoking status`;

/*Q5
Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time
and AVG Alcohol consumption only for people who do exercise atleast 3 days
a week. Show result in descending order awekenings
*/
select Awakenings,avg(`Caffeine consumption`),
avg(`Sleep duration`*(`Deep sleep percentage`/100))  as 'avg_Dsleep_time',
avg(`Alcohol consumption`)
from atul.sleep
where `Exercise frequency` >3
group by Awakenings
order by Awakenings desc;


/*Q6
Display those power stations which have average 'Monitored Cap.(MW)' 
(display the values) between 1000 and 2000 and the number of occurance 
of the power stations (also display these values) are greater than 200.
 Also sort the result in ascending order.
*/
select `power station`, avg(`monitored cap.(mw)`) as 'AVG_capacity'
,count(*) as 'occurance'
from atul.powerg
group by `power station`
having (AVG_capacity between 1000 and 2000) and occurance>200




