--Destination-specific tables

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY,
  name VARCHAR (30),
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
    general_cost VARCHAR(5)
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
    id VARCHAR(50) PRIMARY KEY,  
    email VARCHAR(30),
    name VARCHAR(30),
    user_photo VARCHAR(30)
);

CREATE TABLE itinerary (
    id SERIAL PRIMARY KEY,
    timeframe VARCHAR(30),
    item_description VARCHAR(50),
    destination_id INT REFERENCES destinations(id),
    attraction_id INT REFERENCES attractions(id),
    lodging_id INT REFERENCES lodging(id)
);

CREATE TABLE saved_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    user_id VARCHAR(50) REFERENCES users(id),
    item_id INT REFERENCES itinerary(id)
);

CREATE TABLE past_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    user_id VARCHAR(50) REFERENCES users(id),
    item_id INT REFERENCES itinerary(id)
);


--Additional features

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) REFERENCES users(id),
    comment_date DATE
    --forum_id
);


CREATE TABLE user_photos (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) REFERENCES users(id),
    alt VARCHAR(30),
    photo_date DATE
    --forum_id
);


--Destinations
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Paris', '48.8566° N, 2.3522° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'New York City', '40.7128° N, 74.0060° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Bali', '-8.3405° S, 115.0920° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Rome',  '41.9028° N, 12.4964° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Tokyo', '35.6895° N, 139.6917° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Cancun', '21.1619° N, 86.8515° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Sydney', '-33.8651° S, 151.2099° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Cairo', '30.0444° N, 31.2357° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Brazil','-22.9068° S, -43.1729° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Barcelona', '41.3851° N, 2.1734° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Dubai', '25.2048° N, 55.2708° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Hawaii', '21.3069° N, 157.8583° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Thailand','7.8804° N, 98.3923° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'London', '51.5074° N, 0.1278° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'California', '34.0522° N, 118.2437° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Cape Town', '-33.9249° S, 18.4241° E') ;
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Toronto', '43.6519° N, 79.3832° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Mumbai', '19.0760° N, 72.8777° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Bora Bora', '16.5004° S, 151.7415° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Santorini','36.3932° N, 25.4615° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Zanzibar','6.1659° S, 39.1982° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Mexico City','19.4326° N, 99.1332° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Bangkok','13.7563° N, 100.5018° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Venice','45.4408° N, 12.3155° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Havana', '23.1136° N, 82.3666° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Buenos Aires', '34.6037° S, 58.3816° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Seychelles', '4.6796° S, 55.4920° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Marrakech', '31.6295° N, 7.9811° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Seoul', '37.5665° N, 126.9780° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Vienna', '48.2082° N, 16.3738° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Machu Picchu','13.1631° S, 72.5450° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Maldives','3.2028° N, 73.2207° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Singapore', '1.3521° N, 103.8198° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Budapest','47.4979° N, 19.0402° E'); 
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Copenhagen', '55.6761° N, 12.5683° E');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Punta Cana', '18.5820° N, 68.4055° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Bahamas', '25.0343° N, 77.3963° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Montego Bay','18.4762° N, 77.8939° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Aruba','12.5211° N, 69.9683° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Barbados', '13.1939° N, 59.5432° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'St. Thomas', '18.3358° N, 64.8963° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Turks and Caicos Islands', '21.6940° N, 71.7979° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'St. Lucia','13.9094° N, 60.9789° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Cayman Islands','19.3133° N, 81.2546° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Antigua and Barbuda','17.0608° N, 61.7964° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'St. Maarten','18.0425° N, 63.0548° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Anguilla', '18.2206° N, 63.0686° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Grenada', '12.1165° N, 61.6790° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'St. Kitts and Nevis', '17.3434° N, 62.7559° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Bonaire','12.2011° N, 68.2620° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'Curacao','12.1696° N, 68.9900° W');
INSERT INTO destinations (id, name, coordinates ) VALUES (DEFAULT,'British Virgin Islands','18.4207° N, 64.6399° W');

--Categories
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Beach');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'City');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Nature');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Historical');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Adventure');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Cultural');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Romantic');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Family-Friendly');
INSERT INTO categories (id, name) VALUES (DEFAULT, 'Luxury');


--Seasons Table
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Spring');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Summer');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Fall');
INSERT INTO seasons (id, name) VALUES (DEFAULT, 'Winter');

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
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT,'Eiffel Tower', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT,'Louvre Museum', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Notre-Dame Cathedral', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Statue of Liberty', '$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Central Park', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Ubud Monkey Forest', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Tanah Lot Temple', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Colosseum', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Trevi Fountain', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Imperial Palace', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Chichen Itza', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Cancun Underwater Museum', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Sydney Harbour Bridge', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Sydney Opera House', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Great Pyramids of Giza', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Khan el-Khalili Bazaar', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Copacabana Beach', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Christ the Redeemer', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Park Güell', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Sagrada Familia', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Burj Khalifa', '$$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Palm Jumeirah', '$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Waikiki Beach', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Diamond Head', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Phuket Old Town', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Phi Phi Islands', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Tower of London', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Buckingham Palace', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Hollywood Walk of Fame', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Universal Studios Hollywood', '$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Table Mountain', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Robben Island', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'CN Tower', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Ripleys Aquarium of Canada', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Gateway of India', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Marine Drive', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Bora Bora Lagoonarium', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Mount Otemanu', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Marina Bay Sands', '$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Gardens by the Bay', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Fishermans Bastion', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Széchenyi Thermal Bath', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Nyhavn', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Tivoli Gardens', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Saona Island', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Playa Bávaro', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Nassau Straw Market', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Atlantis Paradise Island', '$$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Palm Beach', '$$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Harrisons Cave', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'St. Kitts Scenic Railway', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Washington-Slagbaai National Park', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Willemstad', '$$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'The Baths', '$');
INSERT INTO attractions(id, name, general_cost) VALUES (DEFAULT, 'Bitter End Yacht Club', '$$');


--Lodging Table
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Hotel','$$');
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Resort', '$$$');
INSERT INTO lodging (id, name, general_cost) VALUES (DEFAULT, 'Airbnb', '$$$');

--Users Table
INSERT INTO users (id, email, name, user_photo)VALUES ('googleid1', 'ali33@gmail.com', 'John Doe', './avatar.jpg');
INSERT INTO users (id, email, name, user_photo)VALUES ('googleid2', 'jane456@gmail.com', 'Jane Smith', './avatar.jpg');
INSERT INTO users (id, email, name, user_photo)VALUES ('googleid3', 'mark789@gmail.com', 'Mark Johnson', './avatar.jpg');

--Itinerary Table, id or id, both are not necessary each input
INSERT INTO itinerary (id, timeframe, item_description,destination_id,attraction_id) VALUES (DEFAULT, 'Aug 8-14','Going to Ubud Monkey forest',3,6);

--Saved Trips Table
--INSERT INTO saved_trips (id, name, user_id, item_id)VALUES (DEFAULT, 'Trip to Bali', 'googleid1', 1);

--Past Trip Table
--INSERT INTO past_trips (id, name, user_id, item_id) VALUES (DEFAULT, 'Paris Trip Day 1', 'googleid2',2);
--INSERT INTO past_trips (id, name, user_id, item_id) VALUES (DEFAULT, 'Paris Trip Day 2', 'googleid2',3);
--INSERT INTO past_trips (id, name, user_id, item_id) VALUES (DEFAULT, 'Bali Trip', 'googleid3',4);

--Additional Features

--Comments Table
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid1','2023-06-23', 1)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid2','2023-06-23', 3)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid3','2023-06-23', 5)

--User Photos Table
--INSERT INTO user_photos (user_id, alt, date)VALUES (1, 1001, 'Photo 1', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (2, 1002, 'Photo 2', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (3, 1003, 'Photo 3', '2023-06-23')
