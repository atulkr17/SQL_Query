SELECT * FROM joins.membership t1
inner join joins.users t2
ON t1.user_id = t2.user_id;