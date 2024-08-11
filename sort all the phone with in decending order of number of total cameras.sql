#sort all the phone with in decending order of number of total cameras
SELECT model,(num_rear_cameras + num_front_cameras) 
AS 'total_camera' FROM atul.smartphones 
order by total_camera DESC
