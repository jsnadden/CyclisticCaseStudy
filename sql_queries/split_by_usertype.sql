SELECT	trip_id,
		start_time,
		end_time,
		bikeid,
		tripduration,
		from_station_id,
		from_station_name,
		to_station_id,
		to_station_name,
		gender,
		birthyear
INTO Trips_2019_Q4_m
FROM GDA_Capstone_Cyclistic.dbo.Trips_2019_Q4
WHERE usertype = 'Subscriber';