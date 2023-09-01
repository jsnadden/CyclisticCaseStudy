SELECT	usertype, COUNT(*)
FROM	Trips_2019_Q1
WHERE	birthyear IS NULL OR gender IS NULL
GROUP BY usertype
ORDER BY usertype