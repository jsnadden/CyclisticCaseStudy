SELECT *
INTO GDA_Capstone_Cyclistic.dbo.Trips_2019_12
FROM GDA_Capstone_Cyclistic.dbo.Trips_2019_Q4
WHERE MONTH(start_time) = 12