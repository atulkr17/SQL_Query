#SELECT * FROM atul.insurance_data;
#What is the average claim amount for non-smoking female patients who are diabetic?
select avg(claim) from atul.insurance_data 
where gender ='female' and 
smoker='NO' and diabetic='yes'