CREATE TABLE destinations (
  destination_id SERIAL PRIMARY KEY,
  desination_name VARCHAR (30),
  coordinates VARCHAR (30)
 
);

CREATE TABLE categories (
category_id SERIAL PRIMARY KEY,
category_name VARCHAR(30)

);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    season_name VARCHAR(30)
);

CREATE TABLE weather (
    weather_id SERIAL PRIMARY KEY,
    weather_type VARCHAR(30)
);

CREATE TABLE photos (
    photo_id SERIAL PRIMARY KEY,
    date  DATE,
    alt VARCHAR(30)
);

CREATE TABLE attractions(
    attraction_id SERIAL PRIMARY KEY,
    attraction_name VARCHAR(30),
    general_cost INT
)


CREATE TABLE lodging (
    lodging_id SERIAL PRIMARY KEY,
    lodging_name VARCHAR(30),
    general_cost VARCHAR(5)
)

CREATE TABLE itinerary (
    itinerary_id SERIAL PRIMARY KEY,
    match_id INT REFERENCES match(match_id),
    date DATE
)

CREATE TABLE trip (
    trip_id SERIAL PRIMARY KEY,
    itinerary_id INT,
    date DATE,
    FOREIGN KEY (itinerary_id) REFERENCES itinerary (itinerary_id)
)

CREATE TABLE saved_trips (
    saved_trips_id SERIAL PRIMARY KEY,
    trip_name VARCHAR(30),
    trip_id INT,
    user_id INT,
    FOREIGN KEY (trip_id) REFERENCES trip (trip_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE past_trips (
    trip_id INT FOREIGN KEY,
    trip_name VARCHAR(30),
    past_trip_id SERIAL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (trip_id) REFERENCES trip(trip_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
)

CREATE TABLE comments (
    comments_id SERIAL PRIMARY KEY,
    trip_id INT,
    user_id INT,
    date DATE,
    FOREIGN KEY (trip_id) REFERENCES pasttrips (trip_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);


CREATE TABLE user_photos (
    photo_id SERIAL PRIMARY KEY,
    trip_id INT,
    user_id INT,
    alt VARCHAR(30),
    date DATE,
    FOREIGN KEY (trip_id) REFERENCES trip (trip_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE user (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(30),
    display_name VARCHAR(30),
    password VARCHAR(30),
    avatar VARCHAR (30),
    email VARCHAR(30)
)

CREATE TABLE match(
    category_id INT FOREIGN KEY NOT NULL,
    season_id INT FOREIGN KEY NOT NULL,
    destination_id INT FOREIGN KEY,
    attraction_id INT FOREIGN KEY,
    lodging_id INT FOREIGN KEY,
    weather_id INT FOREIGN KEY,
    photo_id VARCHAR(50),
    match_id SERIAL PRIMARY KEY
)



//Destinations Table

INSERT INTO destinations (destination_id, destination_name, coordinates) VALUES (1,'Paris', '48.8566° N, 2.3522° E');
INSERT INTO destinations (destination_id, destination_name, coordinates) VALUES (2,'New York City', '40.7128° N, 74.0060° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (3,'Bali', '-8.3405° S, 115.0920° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (4,'Rome',  '41.9028° N, 12.4964° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (5,'Tokyo', '35.6895° N, 139.6917° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (6,'Cancun', '21.1619° N, 86.8515° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (7,'Sydney', '-33.8651° S, 151.2099° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (8,'Cairo', '30.0444° N, 31.2357° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (9,'Brazil','-22.9068° S, -43.1729° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (10,'Barcelona', '41.3851° N, 2.1734° E');
INSERT INTO destinations (destination_id, destination_name, coordinates) VALUES (11,'Dubai', '25.2048° N, 55.2708° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (12,'Hawaii', '21.3069° N, 157.8583° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (13,'Thailand','7.8804° N, 98.3923° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (14,'London', '51.5074° N, 0.1278° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (15,'California', '34.0522° N, 118.2437° W');
INSERT INTO destinations (destination_id, destination_name, coordinates) VALUES (16,'Cape Town', '-33.9249° S, 18.4241° E') ;
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (17,'Toronto', '43.6519° N, 79.3832° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (18,'Mumbai', '19.0760° N, 72.8777° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (19,'Bora Bora', '16.5004° S, 151.7415° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (20,'Santorini','36.3932° N, 25.4615° E');
INSERT INTO destinations (destination_id, destination_name, coordinates) VALUES (21,'Zanzibar','6.1659° S, 39.1982° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (22,'Mexico City','19.4326° N, 99.1332° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (23,'Bangkok','13.7563° N, 100.5018° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (24,'Venice','45.4408° N, 12.3155° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (25,'Havana', '23.1136° N, 82.3666° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (26,'Buenos Aires', '34.6037° S, 58.3816° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (27,'Seychelles', '4.6796° S, 55.4920° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (28,'Marrakech', '31.6295° N, 7.9811° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (29,'Seoul', '37.5665° N, 126.9780° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (30,'Vienna', '48.2082° N, 16.3738° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (31,'Machu Picchu','13.1631° S, 72.5450° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (32,'Maldives','3.2028° N, 73.2207° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (33,'Singapore', '1.3521° N, 103.8198° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (34,'Budapest','47.4979° N, 19.0402° E') 
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (35,'Copenhagen', '55.6761° N, 12.5683° E');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (36,'Punta Cana', '18.5820° N, 68.4055° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (37,'Bahamas', '25.0343° N, 77.3963° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (38,'Montego Bay','18.4762° N, 77.8939° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (39,'Aruba','12.5211° N, 69.9683° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (40,'Barbados', '13.1939° N, 59.5432° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (41,'St. Thomas', '18.3358° N, 64.8963° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (42,'Turks and Caicos Islands', '21.6940° N, 71.7979° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (43,'St. Lucia','13.9094° N, 60.9789° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (44,'Cayman Islands','19.3133° N, 81.2546° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (45,'Antigua and Barbuda','17.0608° N, 61.7964° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (46,'St. Maarten','18.0425° N, 63.0548° W') 
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (47,'Anguilla', '18.2206° N, 63.0686° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (48,'Grenada', '12.1165° N, 61.6790° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (49,'St. Kitts and Nevis', '17.3434° N, 62.7559° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (50,'Bonaire','12.2011° N, 68.2620° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (51,'Curacao','12.1696° N, 68.9900° W');
INSERT INTO destinations (destination_id, destination_name, coordinates ) VALUES (52,'British Virgin Islands','18.4207° N, 64.6399° W');

//Categories Table
INSERT INTO categories (category_id, category_name) VALUES (1, 'Beach');
INSERT INTO categories (category_id, category_name) VALUES (2, 'City');
INSERT INTO categories (category_id, category_name) VALUES (3, 'Nature');
INSERT INTO categories (category_id, category_name) VALUES (4, 'Historical');
INSERT INTO categories (category_id, category_name) VALUES (5, 'Adventure');
INSERT INTO categories (category_id, category_name) VALUES (6, 'Cultural');
INSERT INTO categories (category_id, category_name) VALUES (7, 'Romantic');
INSERT INTO categories (category_id, category_name) VALUES (8, 'Family-Friendly');
INSERT INTO categories (category_id, category_name) VALUES (9, 'Luxury');


//Seasons Table
INSERT INTO seasons (season_id, season_name) VALUES (1, 'Spring');
INSERT INTO seasons (season_id, season_name) VALUES (2, 'Summer');
INSERT INTO seasons (season_id, season_name) VALUES (3, 'Fall');
INSERT INTO seasons (season_id, season_name) VALUES (4, 'Winter');

//Weather Table

INSERT INTO weather (weather_id, weather_type) VALUES (1, 'Sunny');
INSERT INTO weather (weather_id, weather_type) VALUES (2, 'Rainy');
INSERT INTO weather (weather_id, weather_type) VALUES (3, 'Cloudy');
INSERT INTO weather (weather_id, weather_type) VALUES (4, 'Snow');

//Photos Table
INSERT INTO photos (photo_id, date, alt) VALUES ('2023-06-01', 'Beautiful sunset on the beach');
INSERT INTO photos (photo_id, date, alt) VALUES ('2023-06-05', 'Historic landmark in the city');
INSERT INTO photos (photo_id, date, alt) VALUES ('2023-06-10', 'Snow-covered mountain peak') ;
INSERT INTO photos (photo_id, date, alt) VALUES ('2023-06-15', 'Vibrant street art in the alley');
INSERT INTO photos (photo_id, date, alt) VALUES ('2023-06-20', 'Scenic countryside landscape');

//Attractions Table
INSERT INTO attractions (attraction_name, general cost) VALUES ('Eiffel Tower', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Louvre Museum', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Notre-Dame Cathedral', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Statue of Liberty', 25)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Central Park', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Ubud Monkey Forest', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Tanah Lot Temple', 8)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Colosseum', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Trevi Fountain', 5)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Imperial Palace', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Chichen Itza', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Cancun Underwater Museum', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Sydney Harbour Bridge', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Sydney Opera House', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Great Pyramids of Giza', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Khan el-Khalili Bazaar', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Copacabana Beach', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Christ the Redeemer', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Park Güell', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Sagrada Familia', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Burj Khalifa', 30)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Palm Jumeirah', 25)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Waikiki Beach', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Diamond Head', 8)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Phuket Old Town', 8)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Phi Phi Islands', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Tower of London', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Buckingham Palace', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Hollywood Walk of Fame', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Universal Studios Hollywood', 25)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Table Mountain', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Robben Island', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('CN Tower', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Ripleys Aquarium of Canada', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Gateway of India', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Marine Drive', 8)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Bora Bora Lagoonarium', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Mount Otemanu', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Marina Bay Sands', 25)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Gardens by the Bay', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Fishermans Bastion', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Széchenyi Thermal Bath', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Nyhavn', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Tivoli Gardens', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Saona Island', 20)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Playa Bávaro', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Nassau Straw Market', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Atlantis Paradise Island', 25)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Palm Beach', 18)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Harrisons Cave', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('St. Kitts Scenic Railway', 10)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Washington-Slagbaai National Park', 15)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Willemstad', 12)
INSERT INTO attractions (attraction_name, general cost) VALUES ('The Baths', 8)
INSERT INTO attractions (attraction_name, general cost) VALUES ('Bitter End Yacht Club', 15)



//Lodging Table
INSERT INTO lodging (lodging_name, general_cost) VALUES ('Hotel','$$')
INSERT INTO lodging (lodging_name, general_cost) VALUES ('Resort', '$$$');
INSERT INTO lodging (lodging_name, general_cost) VALUES ('Airbnb', '$$$');

//Itinerary Table
INSERT INTO itinerary (match_id, date) VALUES ()




//Trip Table
INSERT INTO trip (itinerary_id, date) VALUES (1, '2023-09-25')
INSERT INTO trip (itinerary_id, date) VALUES (2, '2023-12-25')
INSERT INTO trip (itinerary_id, date) VALUES (3, '2023-11-25')

//Saved Trips Table
INSERT INTO saved trips (trip_name, trip_id, user_id)VALUES ('My Trip', 1, 12345)

//Past Trip Table
INSERT INTO pasttrips (trip_id, trip_name, user_id) VALUES (1, 'Paris Trip', 1001)
INSERT INTO pasttrips (trip_id, trip_name, user_id) VALUES (2, 'New York Trip', 1002)
INSERT INTO pasttrips (trip_id, trip_name, user_id) VALUES (3, 'Bali Trip', 1002)

//Comments Table
INSERT INTO comments (trip_id, user_id, date) VALUES (1, 1001, '2023-06-23')
INSERT INTO comments (trip_id, user_id, date) VALUES (2, 1002, '2023-06-23')
INSERT INTO comments (trip_id, user_id, date) VALUES (3, 1003, '2023-06-23')

// User Photos Table
INSERT INTO user_photos (trip_id, user_id, alt, date)VALUES (1, 1001, 'Photo 1', '2023-06-23')
INSERT INTO user_photos (trip_id, user_id, alt, date)VALUES (2, 1002, 'Photo 2', '2023-06-23')
INSERT INTO user_photos (trip_id, user_id, alt, date)VALUES (3, 1003, 'Photo 3', '2023-06-23')

//User Table
INSERT INTO user (user_name, display_name, password, avatar, email)VALUES ('john123', 'John Doe', 'password123', 'avatar.jpg', 'john@example.com')
INSERT INTO user (user_name, display_name, password, avatar, email)VALUES ('jane456', 'Jane Smith', 'password456', 'avatar.jpg', 'jane@example.com')
INSERT INTO user (user_name, display_name, password, avatar, email)VALUES ('mark789', 'Mark Johnson', 'password789', 'avatar.jpg', 'mark@example.com')

//Match Table
INSERT INTO match (category_id, season_id, destination_id, attraction_id, lodging_id, weather_id, photo_id)VALUES (1, 1, 1, 1, 1, 1, 'photo1.jpg')
