--What are the most popular routes?
SELECT departure_station, arrival_destination, COUNT(*) AS trip_count
FROM train_rides
GROUP BY departure_station, arrival_destination
ORDER BY trip_count DESC;

--What are the peak travel times?
SELECT 
    EXTRACT(HOUR FROM departure_time) AS hour_of_day, 
    COUNT(*) AS trip_count
FROM train_rides
GROUP BY hour_of_day
ORDER BY hour_of_day ;


--How does revenue vary by ticket types and classes?
SELECT ticket_type, ticket_class, 
       SUM(price) AS total_revenue, 
       AVG(price) AS average_price,
       COUNT(*) AS total_trips
FROM train_rides
GROUP BY ticket_type, ticket_class
ORDER BY total_revenue DESC;

-- What is the on-time performance? 
SELECT 
    COUNT(CASE WHEN actual_arrival_time <= arrival_time THEN 1 END) * 100.0 / COUNT(*) AS on_time_percentage
FROM train_rides;

--What are the main contributing factors?
SELECT reason_for_delay, COUNT(*) AS delay_count
FROM train_rides
WHERE actual_arrival_time > arrival_time
GROUP BY reason_for_delay
ORDER BY delay_count DESC;







