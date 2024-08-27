use atul;
Select * from insurance_data;
--  Q1. What are the top 5 patients who claimed the highest insurance amounts?
Select *, dense_rank() over(order by claim DESC) from insurance_data limit 5;

--  Q2. What is the average insurance claimed by patients based on the number of children
--      they have?
Select * from (Select *,
round(avg(claim) over(partition by children),2) as AVG_claim ,
row_number() over(partition by children) as row_num
from insurance_data) t
where t.row_num=1;

-- Q3.  What is the highest and lowest claimed amount by patients in each region?
Select region,min_claim,max_claim from (Select *,
		min(claim) over(partition by region) as 'min_claim',
		max(claim) over(partition by region) as 'max_claim',
		row_number() over(partition by region) as 'row_num'
		from insurance_data) t
where t.row_num=1  ;     

-- Q4. What is the percentage of smokers in each age group?


-- Q5. What is the difference between the claimed amount of each patient and the 
--     first claimed amount of that patient?

Select *, claim-first_value(claim) over()
from insurance_data;

-- Q6  For each patient, calculate the difference between their claimed amount and 
--     the average claimed amount of patients with the same number of children.
Select *, claim-Avg(claim) over(partition by children) 
from insurance_data;

-- Q7  Show the patient with the highest BMI in each region and their respective rank.
Select * from (Select * ,
			rank() over(partition by region order by bmi DESC) as 'group_rank',
			rank() over(order by bmi) as 'overall_rank'
			from insurance_data )t 
where group_rank=1 ;

-- Q8 Calculate the difference between the claimed amount of each patient and the 
--    claimed amount of the patient who has the highest BMI in their region.
Select *, claim-first_value(claim) over(partition by region order by bmi DESC)
from insurance_data


