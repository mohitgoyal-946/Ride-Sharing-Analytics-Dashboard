-- Check total rows
SELECT COUNT(*) AS total_rides FROM rides;

-- Check for NULLs in key columns
SELECT
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_prices,
  SUM(CASE WHEN distance IS NULL THEN 1 ELSE 0 END) AS null_distance,
  SUM(CASE WHEN `source` IS NULL THEN 1 ELSE 0 END) AS null_source,
  SUM(CASE WHEN destination IS NULL THEN 1 ELSE 0 END) AS null_destination
FROM rides;

-- Check min & max dates
SELECT
  MIN(time_stamp) AS earliest,
  MAX(time_stamp) AS latest
FROM rides;

-- Average, min, max price
SELECT
  MIN(price) AS min_price,
  MAX(price) AS max_price,
  AVG(price) AS avg_price
FROM rides;

-- Average distance
SELECT
  MIN(distance) AS min_distance,
  MAX(distance) AS max_distance,
  AVG(distance) AS avg_distance
FROM rides;

-- Count by cab type
SELECT
  cab_type,
  COUNT(*) AS rides
FROM rides
GROUP BY cab_type
ORDER BY rides DESC;

-- Rides by hour
SELECT
  hour,
  COUNT(*) AS rides_count
FROM rides
GROUP BY hour
ORDER BY hour;

-- Rides by day of week
SELECT
  day_of_week,
  COUNT(*) AS rides_count
FROM rides
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- How many rides have surge pricing?
SELECT
  COUNT(*) AS total_rides,
  SUM(CASE WHEN surge_multiplier > 1 THEN 1 ELSE 0 END) AS surge_rides,
  SUM(CASE WHEN surge_multiplier > 1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS surge_pct
FROM rides;

-- Average price with vs without surge
SELECT
  CASE WHEN surge_multiplier > 1 THEN 'Surge' ELSE 'No Surge' END AS surge_flag,
  COUNT(*) AS rides,
  AVG(price) AS avg_price
FROM rides
GROUP BY surge_flag;

-- Top 10 sources
SELECT
  source,
  COUNT(*) AS rides_count
FROM rides
GROUP BY source
ORDER BY rides_count DESC
LIMIT 10;

-- Top 10 destinations
SELECT
  destination,
  COUNT(*) AS rides_count
FROM rides
GROUP BY destination
ORDER BY rides_count DESC
LIMIT 10;

-- Most common pairs
SELECT
  source,
  destination,
  COUNT(*) AS rides_count
FROM rides
GROUP BY source, destination
ORDER BY rides_count DESC
LIMIT 10;

-- Average price when raining vs not raining
SELECT
  CASE WHEN rain > 0 THEN 'Raining' ELSE 'No Rain' END AS rain_flag,
  COUNT(*) AS rides,
  AVG(price) AS avg_price
FROM rides
GROUP BY rain_flag;
