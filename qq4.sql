#SELECT * FROM atul.insurance_data;
#Find no of unique patients who are not from southwest region.
select count(distinct(patientID)) from atul.insurance_data where region <>'southwest'