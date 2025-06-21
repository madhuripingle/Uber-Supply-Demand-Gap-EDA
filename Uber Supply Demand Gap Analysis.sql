select * from [Uber Request Data]

--1.Total number of request
SELECT COUNT(*) AS total_request FROM [Uber Request Data];

--2.Number of completed trips
SELECT COUNT(*) AS completed_trips FROM [Uber Request Data] WHERE Status = 'Trip Completed';

--3.Number of cancelled trips
SELECT COUNT(*) AS cancelled_trips FROM [Uber Request Data] WHERE Status = 'Cancelled';

--4.Number of no cars available
SELECT COUNT(*) AS no_cars_available FROM [Uber Request Data] WHERE Status = 'no cars available';

--5.Requests by pickup point
SELECT Pickup_point, COUNT(*) AS request_count FROM [Uber Request Data] GROUP BY Pickup_point;

--6.Status distribution by pickup point
SELECT Pickup_point, Status, COUNT(*) AS Status_count
FROM [Uber Request Data]
GROUP BY Pickup_point, Status;


--7.Peak Up request Hour
SELECT Request_Hours  AS requst_count
FROM [Uber Request Data]
GROUP BY Request_Hours
ORDER BY requst_count DESC;

--8.Supply demand gap by pickup point
SELECT Pickup_point,
       SUM(CASE WHEN Status = 'Trip Completed' THEN 1 ELSE 0 END) AS supply,
	   COUNT(*) AS demand,
	   COUNT(*) - SUM(CASE WHEN Status = 'Trip Completed' THEN 1 ELSE 0 END) AS gap
FROM [Uber Request Data]
GROUP BY Pickup_point;

 

