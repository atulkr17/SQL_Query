use atul;
Select * from ipl;
Select * from (Select BattingTeam,batter,sum(batsman_run) as 'total_run',
			DENsE_RANK() OVER(PARTITION BY battingTeam order by sum(batsman_run)) as 'rankinh_witjin_time'
			from ipl
			group by battingTeam,batter)t
where t.rankinh_witjin_time < 6
order by t.battingTeam,t.rankinh_witjin_time DESC;  

Select 
concat('match-',CAST(row_number() over(order by ID)as char)) as 'match_no',
sum(batsman_run) as "run record",
sum(sum(batsman_run)) over w as 'career_runs',
avg(sum(batsman_run)) over w as 'career_avg'
from ipl  
where batter='V kohli'   
group by ID  
window w as (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
