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
  latitude FLOAT,
  photo VARCHAR(200)
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


--User-specific tables

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    google_id VARCHAR(50), 
    email VARCHAR(30),
    name VARCHAR(30)
);

CREATE TABLE saved_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    date DATE,
    user_id INT REFERENCES users(id)
);

CREATE TABLE users_saved_trips (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES saved_trips(id),
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
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Paris', 'France', 2.3522, 48.8566, 'https://wikitravel.org/upload/shared/6/6f/Paris_Banner.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'New York City', 'United States', -74.0060, 40.7128, 'https://p1.pxfuel.com/preview/317/554/554/urban-business-city-nyc.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bali', 'Indonesia', 115.0920, -8.3405, 'https://images.pexels.com/photos/1168127/pexels-photo-1168127.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Rome',  'Italy', 12.4964,  41.9028, 'https://www.publicdomainpictures.net/pictures/270000/velka/italy-roma-trevi-fountain.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tokyo', 'Japan', 139.6917, 35.6895, 'https://muza-chan.net/aj/poze-weblog7/greenpeace-pachinko-shinjuku-night-big.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cancun', 'Mexico', -86.8515,  21.1619, 'https://ak.picdn.net/shutterstock/videos/1010564900/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Sydney', 'Australia', 151.2099, -33.8651, 'https://www.populationdata.net/wp-content/uploads/2016/05/Sydney-Harbour.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cairo', 'Egypt', 31.2357, 30.0444, 'https://c2.staticflickr.com/2/1390/5146069762_05010b2585_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Rio De Janeiro', 'Brazil', -43.1729, -22.9068, 'https://ak2.picdn.net/shutterstock/videos/1027304792/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Barcelona', 'Spain', 2.1734, 41.3851, 'https://www.publicdomainpictures.net/pictures/220000/velka/colorful-street-in-barcelona.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Dubai', 'United Arab Emirates', 55.2708, 25.2048, 'https://ak6.picdn.net/shutterstock/videos/11548706/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Hawaii', 'United States', -157.8583, 21.3069, 'https://live.staticflickr.com/65535/50456670118_2d967cf31d.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Phuket', 'Thailand', 98.3923, 7.8804, 'https://www.populationdata.net/wp-content/uploads/2016/05/Thailande-Phuket.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'London', 'United Kingdom',  -0.1278, 51.5074, 'https://www.publicdomainpictures.net/pictures/180000/velka/london-parliament-at-sunset.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Los Angeles', 'United States', -118.2437, 34.0522, 'https://www.viaggi-usa.it/wp-content/uploads/2013/12/los-angeles-guida.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cape Town', 'South Africa', 18.4241, -33.9249, 'https://live.staticflickr.com/8648/16547982259_80a658294f_b.jpg') ;
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Toronto', 'Canada', -79.3832, 43.6519, 'https://live.staticflickr.com/65535/48993906211_1534a8f85d_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Mumbai', 'India', 72.8777, 19.0760, 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Mumbai_India.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bora Bora', 'French Polynesia', -151.7415, -16.5004, 'https://upload.wikimedia.org/wikipedia/commons/7/79/Bora-Bora_from_the_air.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Santorini', 'Greece', 25.4615, 36.3932, 'https://upload.wikimedia.org/wikipedia/commons/8/82/Oia,_Santorini_HDR_sunset.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Zanzibar', 'Tanzania', 39.1982, -6.1659, 'https://101lugaresincreibles.com/wp-content/uploads/2014/01/zanzibar-tanzania-e1456940230270.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Mexico City', 'Mexico', -99.1332, 19.4326, 'https://www.publicdomainpictures.net/pictures/100000/velka/angel-statue-in-mexico-city.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bangkok', 'Thailand', 100.5018, 13.7563, 'https://c4.wallpaperflare.com/wallpaper/999/890/442/thailand-bangkok-city-at-night-streets-lights-cars-wallpaper-preview.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Venice', 'Italy', 12.3155, 45.4408, 'https://4.bp.blogspot.com/-jpT4w3XMeIU/WBxmHC-vGLI/AAAAAAAAApk/oODb2gHvEx43glZCFoYhjZ2sB7uq6j4qQCLcB/s1600/venice.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Havana', 'Cuba', -82.3666, 23.1136, 'https://1.bp.blogspot.com/-GJanwkHShOg/XfFauWDezbI/AAAAAAABs_c/oJm4ZkpWmhcbxNrck76zNzro_kjLov5XQCLcBGAsYHQ/s1600/33730637645_27b3c638f3_k.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Buenos Aires', 'Argentina', -58.3816, -34.6037, 'https://ak8.picdn.net/shutterstock/videos/25395728/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Seychelles', 'Seychelles', 55.4920, -4.6796, 'https://m.blog.hu/go/govia/image/seychelles-6-shutterstock_298384343.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Marrakech', 'Morocco', -7.9811, 31.6295, 'https://c0.wallpaperflare.com/preview/580/369/135/building-market-shop-bazaar.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Seoul', 'South Korea',  126.9780, 37.5665, 'https://www.populationdata.net/wp-content/uploads/2016/05/seoul-de-nuit-coree-du-sud.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Vienna', 'Austria',  16.3738, 48.2082, 'https://upload.wikimedia.org/wikipedia/commons/6/62/Karlskirche_Vienna_Front.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Machu Picchu', 'Peru', -72.5450, -13.1631, 'https://static.pexels.com/photos/355284/pexels-photo-355284.jpeg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Maldives', 'Maldives', 73.2207, 3.2028, 'https://p0.piqsels.com/preview/190/39/635/maldives-paradise-island-holidays.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Singapore', 'Singapore', 103.8198, 1.3521, 'https://images.pexels.com/photos/777059/pexels-photo-777059.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Budapest', 'Hungary', 19.0402, 47.4979, 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Budapest_Parlament_Building.jpg'); 
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Copenhagen', 'Denmark', 12.5683, 55.6761, 'https://live.staticflickr.com/5620/31254274942_2550905557_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Punta Cana', 'Dominican Republic', -68.4055, 18.5820, 'https://live.staticflickr.com/8285/7712718868_30831956fe.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bahamas', 'Bahamas', -77.3963, 25.0343, 'https://c1.peakpx.com/wallpaper/942/171/674/nassau-island-lighthouse-bahamas-wallpaper-preview.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Montego Bay', 'Jamaica', -77.8939, 18.4762, 'https://4.bp.blogspot.com/-6Js3M0HXPFU/UOrIqoIEVkI/AAAAAAAAD4Q/d1MzGTNBe8Y/s1600/IMG_0213.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Aruba', 'Aruba', -69.9683, 12.5211, 'https://live.staticflickr.com/3937/15406640718_f014421b0e_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Barbados', 'Barbados', -59.5432, 13.1939, 'https://photos.travellerspoint.com/190818/large_Crane-778.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'St. Thomas', 'US Virgin Islands', -64.8963, 18.3358, 'https://c2.staticflickr.com/6/5080/7172327002_271b9bda56_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Turks and Caicos Islands', 'Turks and Caicos', -71.7979, 21.6940, 'https://farm8.staticflickr.com/7326/10995169685_f3bc589644_z.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'St. Lucia', 'St. Lucia', -60.9789, 13.9094, 'https://www.wondermondo.com/wp-content/uploads/2019/03/Pitons.jpeg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cayman Islands', 'Cayman Islands', -81.2546, 19.3133, 'https://i0.wp.com/belleabouttown.com/wp-content/uploads/cayman-52.jpg?resize=650%2C460');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Antigua and Barbuda', 'Antigua and Barbuda', -61.7964, 17.0608, 'https://photos.travellerspoint.com/24549/large_20090306_Antigua.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'St. Maarten', 'St. Maarten', -63.0548, 18.0425, 'https://www.wondermondo.com/wp-content/uploads/2017/10/Mahobeach.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Anguilla', 'Anguilla', -63.0686, 18.2206, 'https://live.staticflickr.com/65535/50608751008_1129b5bc82_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Grenada', 'Grenada', -61.6790, 12.1165, 'https://live.staticflickr.com/6030/6208930459_486612776e_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'St. Kitts and Nevis', 'St. Kitts and Nevis', -62.7559, 17.3434, 'https://live.staticflickr.com/65535/49940014048_2b894aa109.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bonaire', 'Bonaire', -68.2620, 12.2011, 'https://live.staticflickr.com/3832/12840799335_cfab5d0ee2_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Curacao', 'Curacao', -68.9900, 12.1696, 'https://www.populationdata.net/wp-content/uploads/2017/05/Willemstad-Curacao-Matthew-T-Rader.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'British Virgin Islands', 'British Virgin Islands', -64.6399, 18.4207, 'https://c1.staticflickr.com/3/2425/3588483252_1d7bae792e_z.jpg?zz=1');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Algiers','Algeria', 3.0875, 36.7323, 'https://4.bp.blogspot.com/-QX7Vra852x4/VnW_wXMnN8I/AAAAAAAAEUs/zhkV3fqR4mg/s1600/Algiers+Waterfront.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Doha', 'Qatar', 51.5225, 25.2793, 'https://i2.wp.com/www.middleeastmonitor.com/wp-content/uploads/2017/05/doha.jpg?resize=1200%2C800&quality=75&strip=all&ssl=1');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Kathmandu', 'Nepal', 85.3240, 27.7172, 'https://wikitravel.org/upload/shared/4/46/Thamel%2CKathmandu%2C_Nepal.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Muscat', 'Oman', 58.5400, 23.6100, 'https://c1.wallpaperflare.com/preview/991/989/134/muscat-oman-mosque.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Delhi', 'India', 77.2090, 28.6139, 'https://live.staticflickr.com/7326/14063144446_cefd7dfeee.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Colombo', 'Sri Lanka', 79.8612, 6.9271, 'https://en.populationdata.net/wp-content/uploads/2017/12/Ancient-Palaice-Sigiriya-Sri-Lanka.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Kuala Lumpur', 'Malaysia', 101.6869, 3.1390, 'https://eduspiral.files.wordpress.com/2012/11/kuala-lumpur.jpeg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Taipei', 'Taiwan', 121.5654, 25.0330, 'https://p0.piqsels.com/preview/552/999/743/taiwan-taipei-taipei-101.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'San Francisco', 'United States', -122.4194, 37.7749, 'https://c.pxhere.com/photos/bd/16/usa_america_san_francisco_ca_california_golden_gate-1389336.jpg!d');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Seattle', 'United States', -122.3321, 47.6062, 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Seattle_City_Light_south_service_center,_1998.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Ketchikan', 'United States', -131.6461, 55.3422, 'https://c1.peakpx.com/wallpaper/672/572/899/creek-street-ketchikan-alaska-wallpaper.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Key West', 'United States', -81.7799, 24.5551, 'https://i0.wp.com/www.angsarap.net/wp-content/uploads/2016/04/key-west-street.jpg?resize=720%2C481&ssl=1');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Antananarivo', 'Madagascar', 47.5079, -18.8792, 'https://upload.wikimedia.org/wikipedia/commons/c/c2/Madagascar_baobab.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Zurich', 'Switzerland', 8.5417, 47.3769, 'https://live.staticflickr.com/5542/9481632893_7fdf960f56.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Istanbul', 'Turkiye', 28.9784, 41.0082, 'https://www.photo-paysage.com/albums/userpics/10001/normal_Istanbul_2.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tehran', 'Iran',  51.3890, 35.6892, 'https://c1.staticflickr.com/7/6055/6299604013_ed48be3975_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Beirut', 'Lebanon', 35.5018, 33.8938, 'https://upload.wikimedia.org/wikipedia/commons/b/bb/West-Beirut1983.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tel Aviv', 'Israel', 34.7818, 32.0853, 'https://ak8.picdn.net/shutterstock/videos/1041772318/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Auckland', 'New Zealand', 174.7633, -36.8485, 'https://ak.picdn.net/shutterstock/videos/1012096829/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Alice Springs', 'Australia', 133.8807, -23.6980, 'https://live.staticflickr.com/7167/6506113307_19fc9895b9_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Melbourne', 'Australia',  144.9631, -37.8136, 'https://www.publicdomainpictures.net/pictures/180000/velka/melbourne-skyline-at-dusk.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Goa', 'India', 74.1240, 15.2993, 'https://images.pexels.com/photos/4086847/pexels-photo-4086847.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Okinawa', 'Japan', 127.6809, 26.2124, 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Furuzamami_beach_Okinawa_Zamami.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Kyoto', 'Japan', 135.7681, 35.0116, 'https://live.staticflickr.com/65535/50361443956_19d9627a84_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Busan', 'South Korea', 129.0756, 35.1796, 'https://live.staticflickr.com/7119/7795604782_fd5ac808bd_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Luxor', 'Egypt', 32.6421, 29.6989, 'https://live.staticflickr.com/65535/33978096998_16ef5d20a1_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Samarkand', 'Uzbekistan', 66.9597, 39.6542, 'https://live.staticflickr.com/4009/4585451018_86618345c8.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Astana', 'Kazakhstan', 71.4460, 51.1801, 'https://live.staticflickr.com/8491/8326447843_03906fef01_b.jpg');




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
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Old Town (Altstadt)', '$', 66);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Lake Zurich', '$', 66);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Hagia Sophia', '$$$', 67);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Grand Bazaar', '$', 67);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Blue Mosque (Sultan Ahmed Mosque)', '$', 67);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Golestan Palace', '$', 68);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jeita Grotto', '$$', 69);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Pigeon Rocks', '$', 69);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Jaffa Old City', '$', 70);
INSERT INTO attractions(id, name, general_cost, destination_id) VALUES (DEFAULT, 'Camel Market', '$', 70);


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

--Saved Trips Table
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Bali', 1);
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Paris', 2);
INSERT INTO saved_trips (id, name, user_id) VALUES (DEFAULT, 'Trip to Singapore',1);

--Attractions-Trips Table
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 1 , 1);

--Matching user id with Saved Trip
--INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, 1, 1)

--Additional Features

--Comments Table
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid1','2023-06-23', 1)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid2','2023-06-23', 3)
--INSERT INTO comments (user_id, date, forum_id) VALUES ('googleid3','2023-06-23', 5)

--User Photos Table
--INSERT INTO user_photos (user_id, alt, date)VALUES (1, 1001, 'Photo 1', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (2, 1002, 'Photo 2', '2023-06-23')
--INSERT INTO user_photos (user_id, alt, date)VALUES (3, 1003, 'Photo 3', '2023-06-23')
