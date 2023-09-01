SELECT	trip_id,
		start_time,
		end_time,
		tripduration,
		DATEDIFF(SECOND, start_time, end_time) - tripduration AS discrepancy
FROM Trips_2019_Q2
WHERE tripduration != DATEDIFF(SECOND, start_time, end_time)
AND ABS(tripduration - DATEDIFF(SECOND, start_time, end_time)) >2;