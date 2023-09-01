SELECT	COUNT(trip_id), birthyear
FROM GDA_Capstone_Cyclistic.dbo.Trips_2019_Q1
WHERE birthyear < 1920
GROUP BY birthyear
ORDER BY birthyear;
