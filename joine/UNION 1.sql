SELECT * FROM joins.membership t1
LEFT JOIN joins.users t2
ON t1.user_id=t2.user_id
UNION 
SELECT * FROM joins.membership t1
RIGHT JOIN joins.users t2 
ON t1.user_id=t2.user_id

