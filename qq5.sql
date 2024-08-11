#SELECT * FROM atul.insurance_data;
#No of patient having normal blood pressure. Normal range[90-120]
select count(*) from atul.insurance_data where bloodpressure between 90 and 120