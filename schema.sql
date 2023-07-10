DROP TABLE IF EXISTS destinations CASCADE; 
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS destinations_categories CASCADE;
DROP TABLE IF EXISTS seasons CASCADE;
DROP TABLE IF EXISTS destinations_seasons CASCADE;
DROP TABLE IF EXISTS weather CASCADE;
DROP TABLE IF EXISTS destinations_weather CASCADE;
DROP TABLE IF EXISTS photos CASCADE;
DROP TABLE IF EXISTS destinations_photos CASCADE;
DROP TABLE IF EXISTS attractions CASCADE;
DROP TABLE IF EXISTS attractions_photos CASCADE;
DROP TABLE IF EXISTS destinations_attractions CASCADE;
DROP TABLE IF EXISTS lodging CASCADE;
DROP TABLE IF EXISTS lodging_photos CASCADE;
DROP TABLE IF EXISTS destinations_lodging CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS itinerary CASCADE;
DROP TABLE IF EXISTS past_trips CASCADE;
DROP TABLE IF EXISTS users_past_trips CASCADE;
DROP TABLE IF EXISTS saved_trips CASCADE;
DROP TABLE IF EXISTS users_saved_trips CASCADE;
DROP TABLE IF EXISTS attractions_trips CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS user_photos CASCADE;

--Destination-specific tables

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY,
  name VARCHAR (30),
  country VARCHAR(30),
  longitude FLOAT,
  latitude FLOAT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE destinations_categories (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    category_id INT REFERENCES categories(id)
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE destinations_seasons (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    season_id INT REFERENCES seasons(id)
);

CREATE TABLE weather (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE destinations_weather (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    weather_id INT REFERENCES weather(id)
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    link VARCHAR(500),
    alt VARCHAR(100)
);

CREATE TABLE destinations_photos (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    photo_id INT REFERENCES photos(id)
);

CREATE TABLE attractions(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    general_cost VARCHAR(5),
    destination_id INT REFERENCES destinations(id)
);

CREATE TABLE attractions_photos (
    id SERIAL PRIMARY KEY,
    attraction_id INT REFERENCES attractions(id),
    photo_id INT REFERENCES photos(id)
);

CREATE TABLE destinations_attractions (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    attraction_id INT REFERENCES attractions(id)
);

CREATE TABLE lodging (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    general_cost VARCHAR(5)
);

CREATE TABLE lodging_photos (
    id SERIAL PRIMARY KEY,
    lodging_id INT REFERENCES lodging(id),
    photo_id INT REFERENCES photos(id)
);

CREATE TABLE destinations_lodging (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    lodging_id INT REFERENCES lodging(id)
);


--User-specific tables, user_id === google id

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    google_id VARCHAR(50), 
    email VARCHAR(30),
    name VARCHAR(30)
);

CREATE TABLE itinerary (
    id SERIAL PRIMARY KEY,
    timeframe VARCHAR(30),
    description VARCHAR(50),
    destination_id INT REFERENCES destinations(id),
    attraction_id INT REFERENCES attractions(id),
    lodging_id INT REFERENCES lodging(id)
);

CREATE TABLE saved_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    user_id INT REFERENCES users(id)
);

CREATE TABLE users_saved_trips (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES saved_trips(id),
    user_id INT REFERENCES users(id)
);

CREATE TABLE past_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    itinerary_id INT REFERENCES itinerary(id)
);

CREATE TABLE users_past_trips (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES past_trips(id),
    user_id INT REFERENCES users(id)
);

CREATE TABLE attractions_trips (
    id SERIAL PRIMARY KEY,
    attraction_id INT REFERENCES attractions(id),
    trip_id INT REFERENCES saved_trips(id)
);


--Additional features

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    comment_date DATE,
    trip_id INT REFERENCES past_trips(id)
);


CREATE TABLE user_photos (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    alt VARCHAR(30),
    photo_date DATE,
    trip_id INT REFERENCES past_trips(id)
);


--Destinations
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Paris', 'France', 2.3522, 48.8566);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'New York City', 'United States', -74.0060, 40.7128);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Bali', 'Indonesia', 115.0920, -8.3405);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Rome',  'Italy', 12.4964,  41.9028);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Tokyo', 'Japan', 139.6917, 35.6895);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Cancun', 'Mexico', -86.8515,  21.1619);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Sydney', 'Australia', 151.2099, -33.8651);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Cairo', 'Egypt', 31.2357, 30.0444);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Rio De Janeiro', 'Brazil', -43.1729, -22.9068);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Barcelona', 'Spain', 2.1734, 41.3851);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Dubai', 'United Arab Emirates', 55.2708, 25.2048);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Hawaii', 'United States', -157.8583, 21.3069);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Phuket', 'Thailand', 98.3923, 7.8804);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'London', 'United Kingdom',  -0.1278, 51.5074);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Los Angeles', 'United States', -118.2437, 34.0522);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Cape Town', 'South Africa', 18.4241, -33.9249) ;
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Toronto', 'Canada', -79.3832, 43.6519);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Mumbai', 'India', 72.8777, 19.0760);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Bora Bora', 'French Polynesia', -151.7415, -16.5004);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Santorini', 'Greece', 25.4615, 36.3932);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Zanzibar', 'Tanzania', 39.1982, -6.1659);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Mexico City', 'Mexico', -99.1332, 19.4326);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Bangkok', 'Thailand', 100.5018, 13.7563);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Venice', 'Italy', 12.3155, 45.4408);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Havana', 'Cuba', -82.3666, 23.1136);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Buenos Aires', 'Argentina', -58.3816, -34.6037);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Seychelles', 'Seychelles', 55.4920, -4.6796);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Marrakech', 'Morocco', -7.9811, 31.6295);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Seoul', 'South Korea',  126.9780, 37.5665);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Vienna', 'Austria',  16.3738, 48.2082);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Machu Picchu', 'Peru', -72.5450, -13.1631);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Maldives', 'Maldives', 73.2207, 3.2028);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Singapore', 'Singapore', 103.8198, 1.3521);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Budapest', 'Hungary', 19.0402, 47.4979); 
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Copenhagen', 'Denmark', 12.5683, 55.6761);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Punta Cana', 'Dominican Republic', -68.4055, 18.5820);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Bahamas', 'Bahamas', -77.3963, 25.0343);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Montego Bay', 'Jamaica', -77.8939, 18.4762);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Aruba', 'Aruba', -69.9683, 12.5211);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Barbados', 'Barbados', -59.5432, 13.1939);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'St. Thomas', 'US Virgin Islands', -64.8963, 18.3358);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Turks and Caicos Islands', 'Turks and Caicos', -71.7979, 21.6940);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'St. Lucia', 'St. Lucia', -60.9789, 13.9094);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Cayman Islands', 'Cayman Islands', -81.2546, 19.3133);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Antigua and Barbuda', 'Antigua and Barbuda', -61.7964, 17.0608);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'St. Maarten', 'St. Maarten', -63.0548, 18.0425);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Anguilla', 'Anguilla', -63.0686, 18.2206);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Grenada', 'Grenada', -61.6790, 12.1165);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'St. Kitts and Nevis', 'St. Kitts and Nevis', -62.7559, 17.3434);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Bonaire', 'Bonaire', -68.2620, 12.2011);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Curacao', 'Curacao', -68.9900, 12.1696);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'British Virgin Islands', 'British Virgin Islands', -64.6399, 18.4207);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Algiers','Algeria', 3.0875, 36.7323);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Doha', 'Qatar', 51.5225, 25.2793);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Kathmandu', 'Nepal', 85.3240, 27.7172);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Muscat', 'Oman', 58.5400, 23.6100);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Delhi', 'India', 77.2090, 28.6139);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Colombo', 'Sri Lanka', 79.8612, 6.9271);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Kuala Lumpur', 'Malaysia', 101.6869, 3.1390);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Taipei', 'Taiwan', 121.5654, 25.0330);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'San Francisco', 'United States', -122.4194, 37.7749);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Seattle', 'United States', -122.3321, 47.6062);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Ketchikan', 'United States', -131.6461, 55.3422);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Key West', 'United States', -81.7799, 24.5551);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Antananarivo', 'Madagascar', 47.5079, -18.8792);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Kigali', 'Rwanda', 30.1044, -1.9706);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Zurich', 'Switzerland', 8.5417, 47.3769);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Istanbul', 'Turkiye', 28.9784, 41.0082);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Tehran', 'Iran',  51.3890, 35.6892);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Beirut', 'Lebanon', 35.5018, 33.8938);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Tel Aviv', 'Israel', 34.7818, 32.0853);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Auckland', 'New Zealand', 174.7633, -36.8485);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Alice Springs', 'Australia', 133.8807, -23.6980);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Melbourne', 'Australia',  144.9631, -37.8136);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Goa', 'India', 74.1240, 15.2993);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Okinawa', 'Japan', 127.6809, 26.2124);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Kyoto', 'Japan', 135.7681, 35.0116);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Busan', 'South Korea', 129.0756, 35.1796);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Alexandria', 'Egypt', 29.9553, 31.2156);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Islamabad', 'Pakistan', 73.0479, 33.6844);
INSERT INTO destinations (id, name, country, longitude, latitude ) VALUES (DEFAULT,'Busan', 'South Korea', 129.0756, 35.1796);




--Categories
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Beach');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'City');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Nature');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Historical');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Adventure');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Cultural');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Romantic');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Family-Friendly');

--Adding Category tags to each destination in a separate table destinations_categories
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 1, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 1, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 1, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 1, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 2, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 2, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 3, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 3, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 3, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 3, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 3, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 4, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 4, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 4, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 4, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 5, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 5, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 6, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 6, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 6, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 7, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 7, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 8, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 8, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 8, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 8, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 9, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 9, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 9, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 10, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 10, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 10, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 10, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 11, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 11, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 11, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 12, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 12, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 12, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 12, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 12, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 13, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 13, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 13, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 13, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 13, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 14, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 14, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 14, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 15, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 15, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 15, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 15, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 16, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 16, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 16, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 17, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 17, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 18, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 18, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 18, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 18, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 19, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 19, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 19, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 19, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 19, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 20, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 20, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 20, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 21, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 21, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 22, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 22, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 23, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 23, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 24, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 24, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 25, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 25, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 26, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 26, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 26, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 27, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 27, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 27, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 28, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 28, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 29, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 29, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 30, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 30, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 30, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 31, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 31, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 31, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 32, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 32, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 32, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 33, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 33, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 34, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 34, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 34, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 35, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 35, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 36, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 36, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 36, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 37, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 37, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 37, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 37, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 38, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 38, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 38, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 38, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 38, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 39, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 39, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 39, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 39, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 40, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 40, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 40, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 41, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 41, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 41, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 42, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 42, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 42, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 42, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 43, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 43, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 43, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 44, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 44, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 44, 8);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 45, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 45, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 46, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 46, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 47, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 47, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 47, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 48, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 48, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 48, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 49, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 49, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 49, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 50, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 50, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 50, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 50, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 51, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 51, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 51, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 52, 1);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 52, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 52, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 52, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 53, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 53, 4);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 53, 6);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 54, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 54, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 54, 7);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 55, 2);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 55, 3);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 55, 5);
INSERT INTO destinations_categories (id, destination_id, category_id) VALUES (DEFAULT, 55, 6);

--Seasons Table
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Spring');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Summer');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Fall');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Winter');

--Adding Best Seasons to Visit For Each Destination
INSERT INTO destinations_seasons (id, destination_id, season_id) VALUES (DEFAULT, 1, 3);

--Weather Table
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Sunny');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Rain');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Cloudy');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Snow');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Humid');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Dry');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Cold');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Hot');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Warm');
INSERT INTO weather (id, name) VALUES (DEFAULT, 'Cool');

--Photos Table
INSERT INTO photos (id, alt, link) VALUES (DEFAULT, 'Beautiful sunset on the beach', 'https://wallpapercave.com/wp/wp4100958.jpg');
INSERT INTO photos (id, alt, link) VALUES (DEFAULT, 'Historic landmark', 'https://static3.bigstockphoto.com/3/2/2/large1500/223766422.jpg');
INSERT INTO photos (id, alt, link) VALUES (DEFAULT, 'Snow-covered mountain peak', 'https://images.pexels.com/photos/618842/pexels-photo-618842.jpeg?auto=compress&cs=tinysrgb&h=650&w=940') ;
INSERT INTO photos (id, alt, link) VALUES (DEFAULT, 'Vibrant street art in the alley','https://jooinn.com/images/street-art-1.jpg');
INSERT INTO photos (id, alt, link) VALUES (DEFAULT, 'Scenic countryside landscape','https://getwallpapers.com/wallpaper/full/6/2/4/1227459-country-scenery-wallpaper-2560x1440-for-samsung-galaxy.jpg');

--Attractions Table
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT,'Eiffel Tower', '$$$', 1);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT,'Louvre Museum', '$$$', 1);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Notre-Dame Cathedral', '$$', 1);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Statue of Liberty', '$$$$', 2);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Central Park', '$', 2);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Ubud Monkey Forest', '$$', 3);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Tanah Lot Temple', '$', 3);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Colosseum', '$$$', 4);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Trevi Fountain', '$', 4);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Imperial Palace', '$$', 5);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Chichen Itza', '$$$', 6);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Cancun Underwater Museum', '$$', 6);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Sydney Harbour Bridge', '$$', 7);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Sydney Opera House', '$$$', 7);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Great Pyramids of Giza', '$$$', 8);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Khan el-Khalili Bazaar', '$', 8);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Copacabana Beach', '$', 9);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Christ the Redeemer', '$', 9);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Park Güell', '$$', 10);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Sagrada Familia', '$$$', 10);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Burj Khalifa', '$$$$$', 11);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Palm Jumeirah', '$$$$', 11);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Waikiki Beach', '$', 12);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Diamond Head', '$', 12);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Phuket Old Town', '$', 13);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Phi Phi Islands', '$$', 13);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Tower of London', '$$', 14);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Buckingham Palace', '$$', 14);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Hollywood Walk of Fame', '$', 15);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Universal Studios Hollywood', '$$$$', 15);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Table Mountain', '$$', 16);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Robben Island', '$', 16);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'CN Tower', '$$$', 17);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Ripleys Aquarium of Canada', '$$', 17);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Gateway of India', '$', 18);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Marine Drive', '$', 18);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Bora Bora Lagoonarium', '$$$', 19);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Mount Otemanu', '$$', 19);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Oia Village', '$$$', 20);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Fira Town', '$$', 20);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jozani Forest', '$', 21);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Nungwi Beach', '$$', 21);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Teotihuacan Pyramids', '$$', 22);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Zocalo', '$', 22);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Wat Arun', '$', 23);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Chatuchak Weekend Market', '$', 23);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Piazza San Marco', '$$', 24);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Rialto Bridge', '$', 24);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Old Havana (Habana Vieja)', '$', 25);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'El Malecon', '$', 25);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Palermo Soho', '$$', 26);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Recoleta Cemetery', '$', 26);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Anse Source d`Argent (La Digue)', '$$', 27);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Vallee de Mai Nature Reserve (Praslin)', '$', 27);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jardin Majorelle', '$', 28);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Medinah Souqs', '$', 28);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Bahia Palace', '$', 28);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Gyeongbokgung Palace', '$', 29);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Myeongdung Shopping Street', '$', 29);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Schonbrunn Palace', '$$', 30);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'St. Stephen`s Cathedral', '$', 30);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Belvedere Palace', '$$', 30);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Machu Picchu Citadel', '$$$$', 31);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Inca Trail', '$$$$', 31);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Snorkeling in Maldives', '$$', 32);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Island Resorts', '$$$$', 32);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Marina Bay Sands', '$$$$', 33);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Gardens by the Bay', '$$$', 33);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Fishermans Bastion', '$$', 34);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Széchenyi Thermal Bath', '$', 34);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Nyhavn', '$$', 35);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Tivoli Gardens', '$$$', 35);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Saona Island', '$$$', 36);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Playa Bávaro', '$$', 36);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Nassau Straw Market', '$', 37);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Atlantis Paradise Island', '$$$$', 37);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Palm Beach', '$$$', 39);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Harrisons Cave', '$$', 40);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'St. Kitts Scenic Railway', '$', 49);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Washington-Slagbaai National Park', '$$', 50);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Willemstad', '$$', 51);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'The Baths', '$', 52);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Bitter End Yacht Club', '$$', 52);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Casbah of Algiers', '$', 53);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jardin d`Essai du Hamma', '$', 53);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Souq Waqif', '$', 54);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'The Pearl-Qatar', '$$$', 54);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Boudhanath Stupa', '$', 55);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Pashupatinath Temple', '$', 55);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Sultan Qaboos Grand Mosque', '$', 56);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Mutrah Souq', '$', 56);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'India Gate', '$', 57);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Red Fort (Lal Qila)', '$', 57);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Galle Face Green', '$', 58);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Gangaramaya Temple', '$', 58);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Petronas Twin Towers', '$$$', 59);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Batu Caves', '$', 59);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Taipei 101', '$$$', 60);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Shilin Night Market', '$', 60);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Golden Gate Bridge', '$', 61);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Alcatraz Island', '$$$', 61);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Fisherman`s Wharf', '$$', 61);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Space Needle', '$', 62);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Pike Place Market', '$', 62);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Totem Bight State Historic Park', '$', 63);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Misty Fjords National Monument', '$$$$', 63);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Duval Street', '$', 64);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Mallory Square', '$', 64);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Lemur`s Park', '$$', 65);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Queens`s Palace (Rova)', '$', 65);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Kimironko Market', '$', 66);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Inema Arts Center', '$$', 66);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Old Town (Altstadt)', '$', 67);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Lake Zurich', '$', 67);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Hagia Sophia', '$$$', 68);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Grand Bazaar', '$', 68);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Blue Mosque (Sultan Ahmed Mosque)', '$', 68);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Golestan Palace', '$', 69);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jeita Grotto', '$$', 70);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Pigeon Rocks', '$', 70);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jaffa Old City', '$', 71);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Camel Market', '$', 71);


--Destinations_Attractions Match Table
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 1,1);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 1,2);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 1,3);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 2,4);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 2,5);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 3,6);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 3,7);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 4,8);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 4,9);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 5,10);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 6,11);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 6,12);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 7,13);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 7,14);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 8,15);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 8,16);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 9,17);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 9,18);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 10,19);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 10,20);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 11,21);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 11,22);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 12,23);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 12,24);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 13,25);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 13,26);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 14,27);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 14,28);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 15,29);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 15,30);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 16,31);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 16,32);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 17,33);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 17,34);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 18,35);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 18,36);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 19,37);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 19,38);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 33,39);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 33,40);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 34,41);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 34,42);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 35,43);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 35,44);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 36,45);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 36,46);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 37,47);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 37,48);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 39,49);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 40,50);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 49,51);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 50,52);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 51,53);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 52,54);
INSERT INTO destinations_attractions(id, destination_id, attraction_id) VALUES (DEFAULT, 52,55);

--Lodging Table
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Hotel','$$');
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Resort', '$$$');
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Airbnb', '$$$');

--Users Table
INSERT INTO users (id, google_id, email, name)VALUES (DEFAULT, 'googleid1', 'john321@gmail.com', 'John Doe');
INSERT INTO users (id, google_id, email, name)VALUES (DEFAULT, 'googleid2', 'jane456@gmail.com', 'Jane Smith');
INSERT INTO users (id, google_id, email, name)VALUES (DEFAULT, 'googleid3', 'mark789@gmail.com', 'Mark Johnson');

--Itinerary Table, id or id, both are not necessary each input
--INSERT INTO itinerary (id, timeframe, description, destination_id, attraction_id) VALUES (DEFAULT, 'Aug 8-14','Going to Ubud Monkey forest', 3, 6);
--INSERT INTO itinerary (id, timeframe, description, destination_id, attraction_id) VALUES (DEFAULT, 'Sep 8','Paris Trip Day 1, The Louvre', 1, 2);

--Saved Trips Table
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Bali', 1);
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Paris', 2);
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Singapore',1);

--Attractions-Trips Table
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 1 , 1);

--Matching user id with Saved Trip
--INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, 1, 1)

--Past Trip Table
--INSERT INTO past_trips (id, name, user_id, item_id) VALUES (DEFAULT, 'Paris Trip Day 1', 2, 2);


--Additional Features

--Comments Table
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid1','2023-06-23', 1)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid2','2023-06-23', 3)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid3','2023-06-23', 5)

--User Photos Table
--INSERT INTO user_photos (user_id, alt, date)VALUES (1, 1001, 'Photo 1', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (2, 1002, 'Photo 2', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (3, 1003, 'Photo 3', '2023-06-23')
