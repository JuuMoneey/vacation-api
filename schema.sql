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
  coordinates VARCHAR (30)
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
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Paris', 'France', '48.8566° N, 2.3522° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'New York City', 'United States', '40.7128° N, 74.0060° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Bali', 'Indonesia', '-8.3405° S, 115.0920° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Rome',  'Italy', '41.9028° N, 12.4964° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Tokyo', 'Japan', '35.6895° N, 139.6917° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Cancun', 'Mexico', '21.1619° N, 86.8515° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Sydney', 'Australia', '-33.8651° S, 151.2099° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Cairo', 'Egypt', '30.0444° N, 31.2357° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Rio De Janeiro', 'Brazil', '-22.9068° S, -43.1729° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Barcelona', 'Spain', '41.3851° N, 2.1734° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Dubai', 'United Arab Emirates', '25.2048° N, 55.2708° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Hawaii', 'United States', '21.3069° N, 157.8583° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Phuket', 'Thailand','7.8804° N, 98.3923° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'London', 'United Kingdom', '51.5074° N, 0.1278° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'California', 'United States', '34.0522° N, 118.2437° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Cape Town', 'South Africa', '-33.9249° S, 18.4241° E') ;
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Toronto', 'Canada', '43.6519° N, 79.3832° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Mumbai', 'India', '19.0760° N, 72.8777° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Bora Bora', 'French Polynesia', '16.5004° S, 151.7415° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Santorini', 'Greece', '36.3932° N, 25.4615° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Zanzibar', 'Tanzania', '6.1659° S, 39.1982° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Mexico City', 'Mexico', '19.4326° N, 99.1332° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Bangkok', 'Thailand', '13.7563° N, 100.5018° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Venice', 'Italy', '45.4408° N, 12.3155° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Havana', 'Cuba', '23.1136° N, 82.3666° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Buenos Aires', 'Argentina', '34.6037° S, 58.3816° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Seychelles', 'Seychelles', '4.6796° S, 55.4920° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Marrakech', 'Morocco', '31.6295° N, 7.9811° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Seoul', 'South Korea', '37.5665° N, 126.9780° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Vienna', 'Austria', '48.2082° N, 16.3738° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Machu Picchu', 'Peru', '13.1631° S, 72.5450° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Maldives', 'Maldives', '3.2028° N, 73.2207° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Singapore', 'Singapore', '1.3521° N, 103.8198° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Budapest', 'Hungary', '47.4979° N, 19.0402° E'); 
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Copenhagen', 'Denmark', '55.6761° N, 12.5683° E');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Punta Cana', 'Dominican Republic', '18.5820° N, 68.4055° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Bahamas', 'Bahamas', '25.0343° N, 77.3963° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Montego Bay', 'Jamaica', '18.4762° N, 77.8939° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Aruba', 'Aruba', '12.5211° N, 69.9683° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Barbados', 'Barbados', '13.1939° N, 59.5432° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'St. Thomas', 'US Virgin Islands', '18.3358° N, 64.8963° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Turks and Caicos Islands', 'Turks and Caicos', '21.6940° N, 71.7979° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'St. Lucia', 'St. Lucia', '13.9094° N, 60.9789° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Cayman Islands', 'Cayman Islands', '19.3133° N, 81.2546° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Antigua and Barbuda', 'Antigua and Barbuda', '17.0608° N, 61.7964° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'St. Maarten', 'St. Maarten', '18.0425° N, 63.0548° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Anguilla', 'Anguilla', '18.2206° N, 63.0686° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Grenada', 'Grenada', '12.1165° N, 61.6790° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'St. Kitts and Nevis', 'St. Kitts and Nevis', '17.3434° N, 62.7559° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Bonaire', 'Bonaire', '12.2011° N, 68.2620° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'Curacao', 'Curacao', '12.1696° N, 68.9900° W');
INSERT INTO destinations (id, name, country, coordinates ) VALUES (DEFAULT,'British Virgin Islands', 'British Virgin Islands', '18.4207° N, 64.6399° W');

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
