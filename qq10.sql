#SELECT * FROM atul.insurance_data;
#Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
update atul.insurance_data
set claim=5000
where patientID=1234