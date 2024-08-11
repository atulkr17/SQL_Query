# find the phone with 2nd largest battery
SELECT model,battery_capacity FROM atul.smartphones 
order by battery_capacity DESC limit 1,1