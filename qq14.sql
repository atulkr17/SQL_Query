/*Group smartphones by the brand and processor
brand and get the count of models and the average 
primary camera resolution*/
SELECT brand_name,processor_brand,count(*) as 'model count',
round(avg(primary_camera_rear)) AS 'primary camera'
FROM atul.smartphones
group by brand_name,processor_brand;