-- Query 1
-- Filter out all forecasting records that have rains, from locations of Asia

SELECT wfddate, dayweather, dayrain, nightweather, nightrain, region, country, location.name
FROM wherethefourcasting.wfd, wherethefourcasting.location
WHERE ((dayrain = 'Rain' OR nightrain = 'Rain')
	AND (wfd.locationID = location.locationID) AND (location.region = 'Asia') );


-- Query 2
-- Select the weather forecasting data in the lastest date of the table, from Asia or Europe, sorted by timezone 
-- with decreasing order

SELECT name, region, wfddate as Date, dayweather, nightweather, timezone
FROM wherethefourcasting.location, wherethefourcasting.wfd
WHERE (wfd.wfddate = (SELECT MAX(wherethefourcasting.wfd.wfddate)
						FROM wherethefourcasting.wfd)
	AND wfd.locationID = location.locationID AND (location.region = 'Asia' OR location.region = 'EUROPE'))
ORDER BY timezone DESC;
                        

-- Query 3
-- Filter out all forcasting records of cities in Asia with average temperature in the range of from 20 to 25
-- Note: avarage temperature of a day is equal to half of the sum of mintemp and maxtemp

SELECT wfddate as date, dayweather, nightweather, dayrain, nightrain, location.name, ((mintemp + maxtemp)/2) as avetemp
FROM wherethefourcasting.wfd, wherethefourcasting.location
WHERE ((wfd.locationID = location.locationID) AND (location.region = 'Asia') 
	AND  ((mintemp + maxtemp)/2 >= 20) AND ((mintemp + maxtemp)/2 <=25) ); 
    

-- Query 4
-- Select all location from a region with average of timezone more than or equal to 0, that has at least
-- 3 days of rain, ordered by region

WITH rainDays AS ( SELECT locationID, COUNT(locationID) as rainNo
					FROM wherethefourcasting.wfd
					WHERE (dayrain = 'Rain'	OR nightrain = 'Rain')
                    GROUP BY locationID)
SELECT name, timezone, region, country, rainNo as numberOfRainDays
FROM wherethefourcasting.location, rainDays
WHERE (location.region in (SELECT location.region
							FROM wherethefourcasting.location
                            GROUP BY timezone
							HAVING (AVG(location.timezone)>0))
	AND location.locationID = rainDays.locationID AND rainDays.rainNo >=3)
ORDER BY region;


-- Query 5
-- Select the weather data in Asia and Europe, sorted by timezone with decreasing order, with only 1 record
-- from each city with its corresponding latest day, from a location that have average mininum temperature 
-- above 20 and average maximum temperature below 35

WITH latestDay AS ( SELECT MAX(wfd.wfddate) as MaxDate, locationID
					FROM wherethefourcasting.wfd
					GROUP BY wfd.locationID),
	aveTemp AS ( SELECT DISTINCT locationID, AVG(minTemp) as minTemp, AVG(maxTemp) as maxTemp
					FROM wherethefourcasting.wfd
					GROUP BY wfd.locationID)
SELECT wfddate, dayweather, nightweather, country, location.name, wfd.locationID, aveTemp.minTemp, aveTemp.maxTemp
FROM wherethefourcasting.wfd, wherethefourcasting.location, latestDay, aveTemp
WHERE ((wfd.locationID = location.locationID) AND (location.region = 'Asia' OR location.region = 'EUROPE')
	AND (wfd.locationID = latestDay.locationID) AND (wfd.wfddate = latestDay.MaxDate)
    AND (wfd.locationID = aveTemp.locationID) AND (aveTemp.minTemp>20) AND (aveTemp.maxTemp<35))
ORDER BY timezone DESC;


-- Query 6
-- Select all username that has registered no email and no phone

SELECT DISTINCT username
FROM wherethefourcasting.user_authen, user_emails, user_phones
WHERE (user_authen.userID NOT IN (SELECT userID from user_emails)
	AND user_authen.userID NOT IN (SELECT userID from user_phones));


-- Query 7
-- In weather information data table, select the latest 3 records from each location

-- Begin query

DROP TABLE IF EXISTS latest5;
DROP TABLE IF EXISTS wfd_clone;

CREATE TABLE wfd_clone LIKE wfd;
INSERT INTO wfd_clone SELECT * FROM wfd;

CREATE TABLE latest5 (
	wfddate DATE,
	locationID INT,
	dayrain VARCHAR(30),
	nightrain VARCHAR(30),
    maxtemp INT,
    mintemp INT
);

-- Loop 1
INSERT INTO latest5 SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID;
WITH Temp AS (SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID)	
DELETE wfd_clone 
FROM wfd_clone, Temp 
WHERE (wfd_clone.wfddate = Temp.wfddate AND wfd_clone.locationID = Temp.locationID);
-- End loop 1

-- Loop 2
INSERT INTO latest5 SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID;
WITH Temp AS (SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID)
DELETE wfd_clone 
FROM wfd_clone, Temp 
WHERE (wfd_clone.wfddate = Temp.wfddate AND wfd_clone.locationID = Temp.locationID);
-- End loop 2

-- Loop 3
INSERT INTO latest5 SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID;
WITH Temp AS (SELECT MAX(wfd_clone.wfddate) as wfddate, locationID, dayrain, nightrain, maxtemp, mintemp
						FROM wfd_clone
						GROUP BY wfd_clone.locationID)
DELETE wfd_clone 
FROM wfd_clone, Temp 
WHERE (wfd_clone.wfddate = Temp.wfddate AND wfd_clone.locationID = Temp.locationID);
-- End loop 3
	
SELECT *
FROM latest5;

DROP TABLE IF EXISTS latest5;
DROP TABLE IF EXISTS wfd_clone;

-- End query


-- Query 8
-- Select users that has searched all locations

WITH user_search_count AS ( 
	SELECT userID, COUNT(DISTINCT(search_location)) as search_count
    FROM user_activities
    GROUP BY userID
)
SELECT DISTINCT userID
FROM user_search_count, location
WHERE (search_count = (SELECT COUNT(*) FROM location));









