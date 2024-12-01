CREATE TABLE IF NOT EXISTS transac_data.geolocation
(
      geolocation_zip_code_prefix VARCHAR(7) PRIMARY KEY
    , geolocation_lat DECIMAL(8, 6)
    , geolocation_lng DECIMAL(9, 6)
    , geolocation_city VARCHAR(50)
    , geolocation_state CHAR(2)
);