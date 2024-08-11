#Write a SQL query to delete all records for patients who are smokers and have no children.
delete FROM atul.insurance_data
where smoker='yes' and children =0