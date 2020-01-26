--вывода времени в формате чч:мм:сс
convert(varchar(20), 'DATEDIFF(ss,LAG(TIME) OVER (order by TIME)', TIME)/3600)+ right( convert(varchar(10), DATEADD(ss, 'DATEDIFF(ss,LAG(TIME) OVER (order by TIME)', TIME),0),108),6) as TIME2

convert(varchar(20),t2.TIME_DELTA/3600)+ right( convert(varchar(10), DATEADD(ss,t2.TIME_DELTA,0),108),6)

--===========