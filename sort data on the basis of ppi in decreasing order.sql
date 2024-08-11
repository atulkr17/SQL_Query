#sort data on the basis of ppi in decreasing order
SELECT model,
round(sqrt(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size,2) as 'ppi'
 FROM atul.smartphones
 order by ppi DESC