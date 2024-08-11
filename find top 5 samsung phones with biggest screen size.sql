#find top 5 samsung phones with biggest screen size
SELECT brand_name,screen_size FROM atul.smartphones
where brand_name='samsung' 
order by screen_size desc limit 5
