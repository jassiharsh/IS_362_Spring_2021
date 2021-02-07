-- Jaspreet Kaur
-- IS 362 Assignment 1: SQL and Tableau
-- 02/06/2021

-- 1. How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
-- There are 23 airplanes with listed speeds. 
-- The maximum spped listed is 432 and the minimum is 90. 

SELECT COUNT(*) FROM planes WHERE speed IS NOT NULL;
SELECT COUNT(speed) FROM planes;

SELECT MAX(speed) FROM planes;
SELECT MIN(speed) FROM planes;

-- 2. What is the total distance flown by all of the planes in January 2013? 
-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
-- The total distance flown by all the planes in the flights table is 350,217,607 miles on 336,776 flights. 
-- The total distance flown by all the planes in 1/2013 is 27,188,805 miles on 27,004 flights
-- The total distance flown by all of the planes in 1/2013 where the tailnum is missing = 81,763 on 155 flights

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights;
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights WHERE (year = 2013 AND month = 1);

SELECT COUNT(tailnum) FROM flights;
SELECT COUNT(tailnum) FROM flights WHERE tailnum = '';			

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights 
	WHERE (year = 2013 AND month = 1) AND tailnum = '';
    
-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
-- Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
-- The LEFT JOIN has 140 additional flights with a total of 127,671 miles grouped to NUL or no listed manufacturer.

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer
order by manufacturer asc;

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

-- 4. Write and answer at least one question of your own choosing that joins information 
-- from at least three of the tables in the flights database.
-- What airports had the most filghts as destinations on January 1, 2013 grouped by manufacturer

SELECT COUNT(*) AS 'Number of Flights', name AS 'Airport', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN airports ON flights.dest = airports.faa
LEFT JOIN planes ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 1 AND flights.day = 1)
GROUP BY faa, manufacturer;

