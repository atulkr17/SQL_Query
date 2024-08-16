CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
    );
    
INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51);









SELECT *,min(marks) over() as "overall _AVG",
max(marks) over(partition by branch) 
FROM atul.marks;


-- Q1 Find all the students who have marks higher than the avg
--  marks of their respective branch
Select * from (select *,avg(marks) 
                over(partition by branch) as "Avg_marks"
                from marks)t1
where t1.marks>t1.Avg_marks;     

-- Q2. 2. Create roll no from branch and marks
Select *,rank() over(partition by branch order by marks DESC) as 'rank' ,
DENSE_RANK() over(order by marks DESC)
from marks;

Select *, concat(branch ,'-' ,row_number() over(partition by branch))
 from marks;
    