# Group smartphones by the extended memory available and get the average price
SELECT extended_memory_available,
avg(price) as 'avg_price'
FROM atul.smartphones
group by extended_memory_available;