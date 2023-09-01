SELECT	COUNT(*)
FROM Trips_2018_Q1
WHERE usertype = 'Subscriber' AND (birthyear IS NULL OR gender IS NULL)