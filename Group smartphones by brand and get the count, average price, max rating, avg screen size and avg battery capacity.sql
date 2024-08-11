#Group smartphones by brand and get the count, 
#average price, max rating, avg screen size and avg battery capacity

SELECT brand_name,count(*) AS 'num_phone'
, avg(price) as 'avg_price', max(rating) as 'max rating',
round(avg(screen_size),4) AS 'avg_screen_size',
round(avg(battery_capacity)) as 'avg battery'
FROM atul.smartphones
group by brand_name
order by num_phone DESC