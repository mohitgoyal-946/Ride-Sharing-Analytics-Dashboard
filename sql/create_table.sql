USE ride_sharing;

-- Drop & Create Table
DROP TABLE IF EXISTS rides;

CREATE TABLE rides (
  id VARCHAR(255),
  distance FLOAT,
  cab_type VARCHAR(50),
  time_stamp BIGINT,
  price FLOAT,
  surge_multiplier FLOAT,
  source VARCHAR(100),
  destination VARCHAR(100),
  product_id VARCHAR(100),
  name VARCHAR(100),
  hour INT,
  day_of_week VARCHAR(20),
  temp FLOAT,
  clouds FLOAT,
  pressure FLOAT,
  rain FLOAT,
  humidity FLOAT,
  wind FLOAT
);
