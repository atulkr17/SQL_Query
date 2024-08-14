use atul;
-- Q1 Find out the average sleep duration of top 15 male candidates
 --  who's sleep duration are equal to  7.5 or greater than 7.5.
 Select avg(`sleep duration`) from sleep 
 where `sleep duration`>=7.5 and gender = 'male'
 order by avg(`sleep duration`) limit 15;
 
 -- Q2 Show avg deep sleep time for both gender. Round result at 2 decimal places.
--     Note: sleep time and deep sleep percentage will give you, deep sleep time.
Select gender,round(avg(`sleep duration`*(`deep sleep percentage`/100)),2) from sleep
group by gender;

-- Q3 Find out the lowest 10th to 30th light sleep percentage records
--    where deep sleep percentage values are between 25 to 45. Display 
--    age, light sleep percentage and deep sleep percentage columns 
--    only.
Select age, `light sleep percentage`,`deep sleep percentage`from sleep 
where `deep sleep percentage` between 25 and 45
order by `light sleep percentage` Asc limit 10,30;


-- Q4 Group by on exercise frequency and smoking status and show average
-- deep sleep time, average light sleep time and avg rem sleep time.
Select avg(`sleep duration`*(`deep sleep percentage`/100)),
avg(`sleep duration`*(`light sleep percentage`/100)),
avg(`sleep duration`*(`rem sleep percentage`/100))
from sleep 
group by `Exercise frequency`,`smoking status`;



-- Q5 Group By on Awekning and show AVG Caffeine consumption, AVG Deep 
--    sleep time and AVG Alcohol consumption only for people who do
--    exercise atleast 3 days a week. Show result in descending order
--    awekenings
Select Awekenings,
avg(`Caffeine consumption`),
avg(`sleep duration`*(`deep sleep percentage`/100)),
avg(`Alcohol consumption`)
from sleep
where `Exercise frequency`>3
group by  Awekenings
order by  Awekenings DESC;

-- Q6 Display those power stations which have average 'Monitored Cap.
--    (MW)' (display the values) between 1000 and 2000 and the number
--    of occurance of the power stations (also display these values) 
--    are greater than 200. Also sort the result in ascending order.
Select `power station`,
AVG(`monitored cap.(mw)`) as 'AVG_cap',
count(*)
from powerg
group by `power station`
having (AVG_cap between 1000 and 2000) and count(*)>200
order by AVG_cap DESC;


-- Q7 Display top 10 lowest "value" State names of which the Year
--    either belong to 2013 or 2017 or 2021 and type is 'Public 
--    In-State'. Also the number of occurance should be between 
--    6 to 10. Display the average value upto 2 decimal places,
--    state names and the occurance of the states.
SELECT state,ROUND(AVG(value),2) from nces
where year IN (2013,2017,2021) and Type='Public In-State'
group by state
having count(*) between 6 and 10
order by ROUND(AVG(value),2) ASC limit 10;


-- Q8 Best state in terms of low education cost (Tution Fees)
--    in 'Public' type university.
Select state,avg(value) from nces
where Type like '%Public%' AND Expense like '%Tuition%'
group by state
order by avg(value) ASC
limit 1;


-- Q9 2nd Costliest state for Private education in year 2021.
--    Consider, Tution and Room fee both.
Select state,avg(value) from nces
where year=2021 and type like'%Private%'
group by state
order by avg(value) DESC limit 1,1

-- Q10  Display total and average values of Discount_offered for 
--      all the combinations of 'Mode_of_Shipment' (display this 
--      feature) and 'Warehouse_block' (display this feature also) 
--      for all male ('M') and 'High' Product_importance. Also 
--      sort the values in descending order of Mode_of_Shipment 
--      and ascending order of Warehouse_block.
# i have not data set for this question

