#SELECT * FROM atul.insurance_data;
#Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
select max(bloodpressure) as MinBP,
min(bloodpressure) as MaxBP 
from atul.insurance_data
 where  smoker='yes' and diabetic='yes'