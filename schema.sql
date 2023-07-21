DROP TABLE IF EXISTS destinations CASCADE; 
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS destinations_categories CASCADE;
DROP TABLE IF EXISTS attractions CASCADE;
DROP TABLE IF EXISTS destinations_attractions CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS saved_trips CASCADE;
DROP TABLE IF EXISTS users_saved_trips CASCADE;
DROP TABLE IF EXISTS attractions_trips CASCADE;

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

CREATE TABLE attractions(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    general_cost VARCHAR(5),
    destination_id INT REFERENCES destinations(id),
    photo VARCHAR(200)
);

CREATE TABLE destinations_attractions (
    id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(id),
    attraction_id INT REFERENCES attractions(id)
);

--User-specific tables

CREATE TABLE users (
    id VARCHAR(100) PRIMARY KEY, 
    email VARCHAR(30),
    name VARCHAR(30),
    given_name VARCHAR(30),
    image_url VARCHAR(200)
);

CREATE TABLE saved_trips (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    destination_id INT REFERENCES destinations(id),
    user_id VARCHAR REFERENCES users(id),
    date DATE
);

CREATE TABLE users_saved_trips (
    id SERIAL PRIMARY KEY,
    trip_id INT REFERENCES saved_trips(id),
    user_id VARCHAR REFERENCES users(id)
);

CREATE TABLE attractions_trips (
    id SERIAL PRIMARY KEY,
    attraction_id INT REFERENCES attractions(id),
    trip_id INT REFERENCES saved_trips(id)
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
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Wadi Rum', 'Jordan', 35.4358, 29.6225, 'https://live.staticflickr.com/4060/4259380067_e6e466cab7.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Sedona', 'United States', -111.7608, 34.8710, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Cathedral_Rock_at_Red_Rock_Crossing.jpg/1200px-Cathedral_Rock_at_Red_Rock_Crossing.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Ushuaia', 'Argentina', -68.3073, -54.8069, 'https://2.bp.blogspot.com/-RGym3W9qpVE/VQLMsOoem_I/AAAAAAAAV5E/sRiPhF5wWTE/s1600/Ushuaia%2B%E2%80%93%2Bthe%2BWorld%E2%80%99s%2BSouthernmost%2BCity%2BFound%2Bin%2BArgentina.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Puerto Montt', 'Chile', -72.9396, -41.4718, 'https://www.shoreexcursionsgroup.com/img/tour/SAMNMONVAR-2.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Santiago', 'Chile', -70.6505, -33.4378, 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Santiago_en_invierno.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Hong Kong', 'China', 114.1628, 22.2793, 'https://ak.picdn.net/shutterstock/videos/31907872/thumb/8.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Shanghai', 'China', 121.4890, 31.2252, 'https://upload.wikimedia.org/wikipedia/commons/d/d6/Hazy_Lujiazui_-_PuDong%2C_Shanghai.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Lisbon', 'Portugal', -9.1366, 38.7078, 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Lisbon_09882_Lisboa_Pra%C3%A7a_don_Pedro_2006_Luca_Galuzzi.jpg' );
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Moab', 'United States', -109.5462, 38.5738, 'https://www.maxpixel.net/static/photo/1x/Scenery-Desert-Red-Rocks-Arid-Moab-Utah-Sandstone-2741025.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Himachal Pradesh', 'India', 77.1828, 31.9292, 'https://upload.wikimedia.org/wikipedia/commons/3/33/Shimla_Southern_Side_of_Ridge.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Costa Rica', 'Costa Rica', -84.0796, 9.9325, 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Arenal_Volcano_-_Costa_Rica_-_by_Ardyiii.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tabriz', 'Iran', 46.2961, 38.0739, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Carpet_Bazaar_of_Tabriz.JPG/1024px-Carpet_Bazaar_of_Tabriz.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Abu Dhabi', 'United Arab Emirates', 54.3878, 24.4221, 'https://c.pxhere.com/photos/4a/d6/abu_dhabi_uae_mosque-913725.jpg!d');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'El Nido', 'Philippines', 119.3905, 11.1800, 'https://live.staticflickr.com/7084/27160278403_ca0d22fdb4_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Fiji', 'Fiji', 179.0123, -18.1234, 'https://www.wondermondo.com/wp-content/uploads/2017/10/Navala.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Montreal', 'Canada', -73.5698, 45.5032, 'https://c.pxhere.com/photos/1b/54/old_montreal_downtown_montreal_canada_building_city_architecture_cityscape-1080663.jpg!d');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Monaco', 'Monaco', 7.4246, 43.7384, 'https://upload.wikimedia.org/wikipedia/commons/4/46/MONACO_by_creactions.jpg'  );
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Malta', 'Malta', 14.5137, 35.8990, 'https://www.wondermondo.com/wp-content/uploads/2017/09/AzureWindow.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Nice', 'France', 7.2684, 43.7009, 'https://c4.wallpaperflare.com/wallpaper/895/24/1008/villefranche-sur-mer-provence-alpes-cote-d-azur-arrondissement-de-nice-hd-wallpaper-preview.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Gibraltar', 'Gibraltar', -5.3536, 36.1408, 'https://www.populationdata.net/wp-content/uploads/2016/05/gibraltar.png');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Edinburgh', 'United Kingdom', -3.1884, 55.9533, 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Edinburgh_Castle_A255786_037.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Ireland', 'Ireland', -6.2602, 53.3498, 'https://pixnio.com/free-images/nature-landscapes/field/ireland-fields-sky-clouds.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bergen', 'Norway', 5.3259, 60.3943, 'https://1.bp.blogspot.com/-KDn-atg5zuA/WU1aHG1MQtI/AAAAAAAAKXI/cVrOJpx4xq4OgaYgyZ2-xSUtp5kC0q9vgCLcBGAs/s1600/Bergen%2BNoruega.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Iceland', 'Iceland', -21.9422, 64.1460, 'https://3.bp.blogspot.com/-lyiW0EfYhcI/VLpSRe3LPHI/AAAAAAAATo0/XYDsgoWEmP0/s1600/Discover%2BVatnaj%C3%B6kull%2B%E2%80%93%2Bthe%2BLargest%2BGlacier%2Bin%2BIceland.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Nagano', 'Japan', 138.0319, 36.1144, 'https://wikitravel.org/upload/shared/a/af/Snow_monkey%40Yamanouchi%2CNagano.JPG');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tromso', 'Norway', 18.9548, 69.6493, 'https://1.bp.blogspot.com/-M5ZtmAJha-U/VHR91D2c6SI/AAAAAAAARnI/aJSUvcGO_wk/s1600/Tromso%E2%80%93Your%2BNext%2BFavorite%2BWinter%2BDestination%2C%2BNorway.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Victoria Falls', 'Zambia', 25.8539, -17.9244, 'https://live.staticflickr.com/4630/39669397992_27bfd31f80.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Foz do Igaucu', 'Brazil', -54.5858, -25.5401, 'https://live.staticflickr.com/819/40154957535_5c55a74b3a_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Skeleton Coast', 'Namibia', 12.6782, -19.2749, 'https://live.staticflickr.com/8744/17085246687_3079aaf372_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Kilimanjaro', 'Tanzania', 37.3540, -3.0764, 'https://elsaelsi.files.wordpress.com/2010/07/kilimanjaro1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Agra', 'India', 78.0099, 27.1753, 'https://upload.wikimedia.org/wikipedia/commons/8/84/Taj_Mahal-04.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cabo San Lucas', 'Mexico', -109.9201, 22.8939, 'https://www.mtievents.com/wp-content/uploads/2016/02/Cabo-San-Lucas.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cozumel', 'Mexico', -86.9203, 20.4318, 'https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2015/11/17736787475_3d953da365_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Puerto Vallarta', 'Mexico', -105.2203, 20.6407, 'https://i0.wp.com/trendingtravelnews.com/wp-content/uploads/2018/08/unnamed-11.jpg?w=1920&ssl=1');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cabo Verde', 'Cabo Verde', -24.0084, 16.0001, 'https://cdn.holidayguru.es/wp-content/uploads/2018/03/Tarrafal-beach-in-Santiago-island-in-Cape-Verde-iStock_000074123707_Large-2.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Tenerife', 'Spain', -16.6214, 28.2936, 'https://www.hotholidays.co.uk/image/original/destination/1527613186.9069_shutterstock_701679028.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Ponta Delgada', 'Portugal', -25.6684, 37.7394, 'https://i2.wp.com/www.decoranddineblog.com/wp-content/uploads/2018/01/Azores-Flores-Island.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cusco', 'Peru', -71.9788, -13.5168, 'https://www.roadaffair.com/wp-content/uploads/2017/10/sunrise-cusco-peru-shutterstock_354971309.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Zermatt', 'Switzerland', 7.7491, 46.0207, 'http://2.bp.blogspot.com/-hAnpo8RW9T8/VddC9vmKx_I/AAAAAAAACKk/qiHXwDKA_lg/s1600/zermatt-valley-switzerland.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Faroe Islands', 'Denmark', -7.0323, 62.0449, 'https://media.cntraveler.com/photos/55ad25b50121edec25705bb7/master/pass/faroe-islands-denmark.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Galapagos', 'Ecuador', -90.3639, -0.6288, 'https://c0.wallpaperflare.com/preview/145/230/358/ecuador-galapagos-islands.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Juneau', 'United States', -134.4197, 58.3019, 'https://www.goodfreephotos.com/albums/united-states/alaska/juneau/landscape-of-mountains-and-fjords-under-clouds-around-juneau-alaska.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Naples', 'Italy', 14.2488, 40.8359, 'https://3.bp.blogspot.com/-NkuZidpI2ww/U_Sc-iBnTYI/AAAAAAAAOnQ/7N4BVpAHxe0/s1600/5.%2BPositano-%2BTop%2B10%2BItalian%2BCoastal%2BSites.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Milan', 'Italy', 9.1905, 45.4668, 'https://susannehultman.se/wp-content/uploads/2016/04/044milano.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Split', 'Croatia', 16.4402, 43.5081, 'https://foto.wuestenigel.com/wp-content/uploads/api/split-harbour-croatia.jpeg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Prague', 'Czechia', 14.4213, 50.0874, 'https://www.publicdomainpictures.net/pictures/210000/velka/old-town-prague.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Munich', 'Germany', 11.5753, 48.1371, 'https://ak.picdn.net/shutterstock/videos/1063854487/thumb/1.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Porto', 'Portugal', -8.6291, 41.1579, 'https://c2.staticflickr.com/6/5205/5253473681_da9b0d1366_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Berlin', 'Germany', 13.3889, 52.5170, 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Brandenburger_Tor_abends.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Crete', 'Greece', 25.1343, 35.3400, 'https://2.bp.blogspot.com/-JK1sql5Gwn8/VVmriQYTFbI/AAAAAAAAaK4/lyo4e1Isay4/s1600/The%2BRomantic%2BOld%2BTown%2Bof%2BChania%2Bin%2BCrete%2C%2BHellas%2B(Greece)!!!.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Denali', 'United States', -151.0062, 63.0691, 'https://www.viaggi-usa.it/wp-content/uploads/2019/04/Denali-National-Park-Cosa-Vedere.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Quito', 'Ecuador', -78.5123, -0.2202, 'https://live.staticflickr.com/7521/16117255152_4e23734970_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Sao Paolo', 'Brazil', -46.6334, -23.5507, 'https://upload.wikimedia.org/wikipedia/commons/d/d9/S%C3%A3o_Paulo_City.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Amsterdam', 'Netherlands', 4.8936, 52.3728, 'https://www.photo-paysage.com/albums/userpics/10001/normal_Balade_le_long_des_canaux_d_Amsterdam_-11.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Cyprus', 'Cyprus', 33.1451, 34.9823, 'https://c0.wallpaperflare.com/preview/1003/576/21/cyprus-larnaca-town-beach-promenade.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Penang', 'Malaysia', 100.2559, 5.4065, 'https://c1.staticflickr.com/5/4087/4835033844_6c01bc32a0_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'San Diego', 'United States', -117.1628, 32.7174, 'https://c1.staticflickr.com/3/2059/2063809562_855e54ff47_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Bocas del Toro', 'Panama', -82.1284, 9.3041, 'https://live.staticflickr.com/2221/2298604063_87234e0945_b.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Washington D.C.', 'United States', -77.0366, 38.8949, 'https://c.pxhere.com/photos/ac/df/sunset_memorial_wwii_lighting_landmark_monument_washington_dc-585739.jpg!s');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Las Vegas', 'United States', -115.1485, 36.1673, 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Las_Vegas_89.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Dubrovnik', 'Croatia', 18.0937, 42.6500, 'https://photos.travellerspoint.com/244804/large_Dubrovnik.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Palma de Mallorca', 'Spain', 2.6502, 39.5696, 'https://live.staticflickr.com/65535/32825924657_be377f5221.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Corsica', 'France', 9.0684, 42.1881, 'http://1.bp.blogspot.com/-q7wLbOrhamM/TbRonyQ71uI/AAAAAAAAAHg/ieQAJ3ou0p0/s1600/Fortress+at+Bonifacio+Corsica.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Stockholm', 'Sweden', 18.0711, 59.3251, 'https://www.tripsavvy.com/thmb/o1zQwCZerDnBl0c_8gyKidJdqeA=/2121x1414/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-679622736-bd006ea055424a868f37b1d253aa1fdb.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Nairobi', 'Kenya', 36.8219, -1.2921, 'https://www.silverbirdsafari-africa.com/blog/wp-content/uploads/2015/12/Mt.-kenya-national-park.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Pitcairn Island','Pitcairn Island', -130.1018, -25.0658, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Pitcairn_Island.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Easter Island','Chile', -109.3496, -27.1259, 'http://brewminate.com/wp-content/uploads/2018/01/011818-43-Easter-Island-Rapa-Nui-History-Anthropology.jpg');
INSERT INTO destinations (id, name, country, longitude, latitude, photo ) VALUES (DEFAULT,'Christmas Island', 'Australia', 105.6173, -10.4912, 'https://fishofgold.files.wordpress.com/2013/11/christmas-island-red-crab_24694_600x450.jpg?w=940');


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

--Attractions Table
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT,'Eiffel Tower', '$$$', 1, 'https://www.citypictures.org/data/media/219/Eiffel%20Tower%20at%20Night,%20Paris,%20France.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT,'Louvre Museum', '$$$', 1, 'http://www.photoeverywhere.co.uk/west/paris/louvre_pyramid3044.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Notre-Dame Cathedral', '$$', 1, 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Notre_Dame_de_Paris_(front_side).jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Statue of Liberty', '$$$$', 2, 'https://www.publicdomainpictures.net/pictures/210000/nahled/statue-of-liberty-14851957389PJ.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Central Park', '$', 2, 'https://upload.wikimedia.org/wikipedia/commons/8/8e/Central_Park_path.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Ubud Monkey Forest', '$$', 3, 'https://intentionallyuntitled.files.wordpress.com/2016/07/img_4217.jpg?w=620');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Tanah Lot Temple', '$', 3, 'https://live.staticflickr.com/7342/13991837515_a72aac2115_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Colosseum', '$$$', 4, 'https://www.freemages.com/album/italie/colisee_loin.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Trevi Fountain', '$', 4, 'https://upload.wikimedia.org/wikipedia/commons/0/07/Trevi_fountain_at_night.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Imperial Palace', '$$', 5, 'https://c1.staticflickr.com/3/2595/3915450937_7d7f125e4a_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Chichen Itza', '$$$', 6, 'https://1.bp.blogspot.com/-bPDLZcSdANs/ULS4le8Hf3I/AAAAAAAAS5g/oP7IjRGW6Mg/s1600/ChichenItza01+copy.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Cancun Underwater Museum', '$$', 6, 'https://4.bp.blogspot.com/-H0breYtaIJ0/UwdjztB9MvI/AAAAAAAAFyU/J8IVCSCZzO0/s1600/This+Extraordinary+Underwater+Museum+Will+Make+You+Speechless+4.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Sydney Harbour Bridge', '$$', 7, 'https://c.pxhere.com/photos/53/9c/sydney_harbour_bridge_australia_bridge_tourism_sydney_harbour_bridge_nsw-487292.jpg!d');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Sydney Opera House', '$$$', 7, 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Sydney_Opera_House_Night.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Great Pyramids of Giza', '$$$', 8, 'https://c4.wallpaperflare.com/wallpaper/662/379/597/cloud-africa-great-pyramids-great-pyramid-wallpaper-preview.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Khan el-Khalili Bazaar', '$', 8, 'https://c1.staticflickr.com/3/2298/2185930460_88ed8cb3d9_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Copacabana Beach', '$', 9, 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Rio_de_janeiro_copacabana_beach_2010.JPG');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Christ the Redeemer', '$', 9, 'https://c4.wallpaperflare.com/wallpaper/819/798/382/rio-de-janeiro-statue-christ-the-redeemer-contrails-aerial-view-wallpaper-thumb.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Park Güell', '$$', 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Park_G%C3%BCell_02.jpg/1200px-Park_G%C3%BCell_02.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Sagrada Familia', '$$$', 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Barcelona_Temple_Expiatori_de_la_Sagrada_Fam_lia_(2050445207).jpg/1200px-Barcelona_Temple_Expiatori_de_la_Sagrada_Fam_lia_(2050445207).jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Burj Khalifa', '$$$$$', 11, 'https://c1.staticflickr.com/3/2701/4257411678_6d5f5a6cf1_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Palm Jumeirah', '$$$$', 11, 'https://oneplaceforyou.com/wp-content/uploads/2015/04/palm_jumeirah_dubai.png');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Kauai', '$', 12, 'http://4.bp.blogspot.com/-awbcEQByVDY/T4Xsvdw13QI/AAAAAAAACW0/mDoGQF1r5u8/s1600/BKP_5540.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Diamond Head', '$', 12, 'https://live.staticflickr.com/65535/50456670118_2d967cf31d_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Phuket Old Town', '$', 13, 'https://c2.staticflickr.com/6/5041/5359243628_ba8022ebca_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Phi Phi Islands', '$$', 13, 'https://pixnio.com/free-images/architecture/towers/tower-of-london-england-from-across-the-river-thames.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Tower of London', '$$', 14, 'https://pixnio.com/free-images/architecture/towers/tower-of-london-england-from-across-the-river-thames.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Buckingham Palace', '$$', 14, 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Buckingham_Palace,_London_-_April_2009.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Hollywood Walk of Fame', '$', 15, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Hollywood_Walk_of_Fame.jpg/1200px-Hollywood_Walk_of_Fame.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Universal Studios Hollywood', '$$$$', 15, 'https://live.staticflickr.com/2941/15204128330_2b36650bc2_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Table Mountain', '$$', 16, 'https://farm4.staticflickr.com/3090/2418536788_4c95e26b86_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Robben Island', '$', 16, 'https://2.bp.blogspot.com/-9qGO4fHumZs/VTozUNouTYI/AAAAAAAABsc/eIzoV7RTihE/s1600/P1010808.JPG');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'CN Tower', '$$$', 17, 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Toronto_-_ON_-_CN_Tower_bei_Nacht2.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Ripleys Aquarium of Canada', '$$', 17, 'https://live.staticflickr.com/8377/29969190136_f571a70ec5_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Gateway of India', '$', 18, 'https://live.staticflickr.com/3864/14456234109_72f7591b97_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Marine Drive', '$', 18, 'https://ak.picdn.net/shutterstock/videos/1029022766/thumb/1.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Bora Bora Lagoonarium', '$$$', 19, 'https://live.staticflickr.com/3124/3095124154_1f69f1043b_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Mount Otemanu', '$$', 19, 'https://live.staticflickr.com/8626/16551108949_150a360dfc_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Oia Village', '$$$', 20, 'https://global-geography.org/attach/Geography/Europe/Greece/Pictures/Santorinis_Villages/Oia_6/SV0193_Oiajpg.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Fira Town', '$$', 20, 'https://live.staticflickr.com/3269/5768544375_0a07a01d72_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Jozani Forest', '$', 21, 'https://usitcolours.bg/web/files/richeditor/articles/Zanzibar/Usit-Zanzibar-Jozani-Forest.png');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Nungwi Beach', '$$', 21, 'https://live.staticflickr.com/4045/4325834765_d6cbfb7fd5_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Teotihuacan Pyramids', '$$', 22, 'https://live.staticflickr.com/8680/15241384053_78f0d209bd_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Zocalo', '$', 22, 'https://upload.wikimedia.org/wikipedia/commons/0/04/Zocalo_cathedral.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Wat Arun', '$', 23, 'https://c2.staticflickr.com/8/7107/7432784080_660a76be96_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Chatuchak Weekend Market', '$', 23, 'https://anakjajan.files.wordpress.com/2017/11/dscf4959.jpg?w=948&h=632');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Piazza San Marco', '$$', 24, 'https://c1.staticflickr.com/5/4147/5055129333_a68f201ef7_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Rialto Bridge', '$', 24, 'https://upload.wikimedia.org/wikipedia/commons/8/83/Rialto_bridge_2011.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Old Havana (Habana Vieja)', '$', 25, 'https://clamorworld.com/wp-content/uploads/2018/07/cd763ed8-85ad-11e8-a662-45bbb3f001dc-600x338.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'El Malecon', '$', 25, 'https://farm3.staticflickr.com/2869/33499570561_db043b98b2_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Palermo Soho', '$$', 26, 'https://live.staticflickr.com/7374/27014765263_973bdee038.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Anse Source d`Argent (La Digue)', '$$', 27, 'https://live.staticflickr.com/5566/14712956897_a8fa2c582d_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Vallee de Mai Nature Reserve (Praslin)', '$', 27, 'https://wikitravel.org/upload/shared/3/3f/Vallee_de_Mai_National_Park_001%2C_Praslin%2C_Seychelles.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Jardin Majorelle', '$', 28, 'https://live.staticflickr.com/5693/30349339863_80aae3111d_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Medinah Souqs', '$', 28, 'https://c2.staticflickr.com/4/3315/4584392210_4d992930dc_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Gyeongbokgung Palace', '$', 29, 'https://live.staticflickr.com/4012/4271054092_0bb24b97c9_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Myeongdung Shopping Street', '$', 29, 'https://live.staticflickr.com/8165/6954838436_5177abe263_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Schonbrunn Palace', '$$', 30, 'https://live.staticflickr.com/8450/8057435987_645cbfc7f9.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'St. Stephen`s Cathedral', '$', 30, 'https://austria-forum.org/attach/AEIOU/Stephansdom/scaled-500x659-Wien_-_Stephansdom.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Belvedere Palace', '$$', 30, 'https://live.staticflickr.com/185/437998739_2b39002f9b_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Machu Picchu Citadel', '$$$$', 31, 'https://www.greenme.it/wp-content/uploads/2020/06/mache-picchu.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Inca Trail', '$$$$', 31, 'https://global-geography.org/attach/Geography/America/Peru/Pictures/Machu_Picchu/Intipunku_-_Inca_Trail_3/scaled-900x598-pi579_Inka_Trail_zum_Intipunktu.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Snorkeling in Maldives', '$$', 32, 'https://live.staticflickr.com/7349/9341396811_cebd73d5a2_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Island Resorts', '$$$$', 32, 'https://i0.wp.com/privatekeymagazine.com/wp-content/uploads/2020/07/image1-7.png?resize=1050%2C700&ssl=1');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Marina Bay Sands', '$$$$', 33, 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Marina_Bay_Sands_in_the_evening_-_20101120.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Gardens by the Bay', '$$$', 33, 'https://c2.staticflickr.com/8/7466/27422262561_00912d6620_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Fishermans Bastion', '$$', 34, 'https://live.staticflickr.com/3848/14360113552_b0e44f077e_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Széchenyi Thermal Bath', '$', 34, 'https://live.staticflickr.com/6009/6004036628_01e818635d_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Nyhavn', '$$', 35, 'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kopenhagen-Nyhavn.JPG');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Tivoli Gardens', '$$$', 35, 'https://upload.wikimedia.org/wikipedia/commons/c/cc/Tivoligardens2.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Saona Island', '$$$', 36, 'https://www.publicdomainpictures.net/pictures/180000/velka/saona-island-1467444576xjU.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Playa Bávaro', '$$', 36, 'https://live.staticflickr.com/3190/2708903664_7a75d53eca_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Atlantis Paradise Island', '$$$$', 37, 'https://live.staticflickr.com/3701/10095851544_fdee32fa53_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Palm Beach', '$$$', 39, 'https://soundsandcolours.com/static/2021/02/caribbean-casino.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Harrisons Cave', '$$', 40, 'https://live.staticflickr.com/8259/8617632250_5e089ecb87_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'St. Kitts Scenic Railway', '$', 49, 'https://live.staticflickr.com/65535/49931767708_ac997cddee_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Washington-Slagbaai National Park', '$$', 50, 'https://live.staticflickr.com/65535/49039082128_8f4ee07848.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Willemstad', '$$', 51, 'https://live.staticflickr.com/7024/6704166179_c30640af08_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'The Baths', '$', 52, 'https://media-cdn.tripadvisor.com/media/photo-s/03/cd/46/12/the-baths.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Bitter End Yacht Club', '$$', 52, 'https://c1.staticflickr.com/3/2425/3588483252_1d7bae792e_z.jpg?zz=1');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Casbah of Algiers', '$', 53, 'https://live.staticflickr.com/7481/15242560034_f2c2946c74_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Jardin d`Essai du Hamma', '$', 53, 'https://1.bp.blogspot.com/-mzFUtuywZPw/UogFw7m-PgI/AAAAAAAAns4/b9NZI6gWROk/s640/Rollei%2B18-04.JPG');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Souq Waqif', '$', 54, 'https://www.goodfreephotos.com/albums/qatar/souq-waqif-doha-qatar-streets.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'The Pearl-Qatar', '$$$', 54, 'https://www.ingirofotografando.it/wp-content/uploads/2020/03/Doha-42-2048x1365.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Boudhanath Stupa', '$', 55, 'https://c2.staticflickr.com/8/7225/7142325071_c8fb6bf269_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Pashupatinath Temple', '$', 55, 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Pashupatinath.Overview.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Sultan Qaboos Grand Mosque', '$', 56, 'https://i2.wp.com/www.omantripper.com/wp-content/uploads/2020/05/Sultan-Qaboos-Mosque-Sohar-10.jpg?fit=1170%2C781&ssl=1');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Mutrah Souq', '$', 56, 'https://live.staticflickr.com/1758/41641750625_7875c672de_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'India Gate', '$', 57, 'https://live.staticflickr.com/2012/1966276938_b3c5c5aae7_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Red Fort (Lal Qila)', '$', 57, 'https://natural-universe.net/wp-content/uploads/2015/07/in06_0307_13010_s_ajabCs600.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Galle Face Green', '$', 58, 'https://live.staticflickr.com/181/31150403220_c110b1d21e_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Gangaramaya Temple', '$', 58, 'https://live.staticflickr.com/3920/14384612105_6e3e13ebbd_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Petronas Twin Towers', '$$$', 59, 'https://upload.wikimedia.org/wikipedia/commons/f/f1/Torres_Petronas_Mayo_2004.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Batu Caves', '$', 59, 'https://live.staticflickr.com/699/20876168172_81f05b13c0_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Taipei 101', '$$$', 60, 'https://www.publicdomainpictures.net/pictures/210000/velka/taipei-101-at-late-dusk.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Shilin Night Market', '$', 60, 'https://live.staticflickr.com/1716/26064067814_5e4b93713e_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Golden Gate Bridge', '$', 61, 'https://live.staticflickr.com/440/19022211114_5599e3c68a.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Alcatraz Island', '$$$', 61, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Alcatraz_Island_photo_D_Ramey_Logan.jpg/1200px-Alcatraz_Island_photo_D_Ramey_Logan.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Fisherman`s Wharf', '$$', 61, 'https://live.staticflickr.com/27/66128081_6bdf54eb6b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Space Needle', '$', 62, 'https://upload.wikimedia.org/wikipedia/commons/2/27/Y_Space-Needle-at-Night.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Pike Place Market', '$', 62, 'https://upload.wikimedia.org/wikipedia/commons/6/64/Pike_Place_Market_Entrance.JPG');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Totem Bight State Historic Park', '$', 63, 'https://live.staticflickr.com/1277/869102302_4831d1c0e0_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Misty Fjords National Monument', '$$$$', 63, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Mifj_inlet.jpg/1200px-Mifj_inlet.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Duval Street', '$', 64, 'https://live.staticflickr.com/4048/4386220686_882a958304.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Lemur`s Park', '$$', 65, 'https://c.pxhere.com/photos/92/f7/lemur_animal_madagascar_zoo-189076.jpg!d');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Queens`s Palace (Rova)', '$', 65, 'https://c2.staticflickr.com/4/3272/2712793007_e4cfb7532f_z.jpg?zz=1');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Old Town (Altstadt)', '$', 66, 'https://c2.staticflickr.com/4/3183/3066371027_4a6aac77e6_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Hagia Sophia', '$$$', 67, 'https://ohiostate.pressbooks.pub/app/uploads/sites/198/2019/06/exterior-3.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Grand Bazaar', '$', 67, 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Grand-Bazaar_Shop.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Blue Mosque (Sultan Ahmed Mosque)', '$', 67, 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Sultan_Ahmed_Mosque.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Golestan Palace', '$', 68, 'https://live.staticflickr.com/3909/32807000365_a7895159dc_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Jeita Grotto', '$$', 69, 'https://stateofmind13.files.wordpress.com/2011/10/jeita-grotto-lebanon-11.jpg?w=620');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Pigeon Rocks', '$', 69, 'https://p0.piqsels.com/preview/626/49/198/lebanon-beirut-rouche-rocks-pigeon-rock.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Jaffa Old City', '$', 70, 'https://live.staticflickr.com/8508/30095191966_c3f57aa094.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Carmel Market', '$', 70, 'https://live.staticflickr.com/8171/8018942282_fdfa20107f_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Waiheke Island', '$$$', 71, 'https://mega-stoffel.de/weblog/wp-content/uploads/2017/12/wp-1513680396214..jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Sky Tower', '$$$', 71, 'https://i0.hippopx.com/photos/262/178/532/sky-tower-auckland-new-zealand-city-preview.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Uluru-Kata Tjuta National Park', '$$$', 72, 'https://wikitravel.org/upload/shared/d/dc/Uluru_Kata_Tjuta_National_Park_banner.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Alice Springs Desert Park', '$$', 72, 'https://mlokwhrswjbg.i.optimole.com/vVq-Rbc-SCBgZyoY/w:1400/h:1050/q:80/https://www.clashboomband.com/wp-content/uploads/2020/02/Northern-Australia-74.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Royal Botanic Gardens', '$', 73, 'https://live.staticflickr.com/2705/4507576239_019a7f47fb_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Calangute Beach', '$', 74, 'https://live.staticflickr.com/154/354975321_1f9737bbfd.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Dudhsagar Falls', '$$', 74, 'https://live.staticflickr.com/4759/40171907451_ccbcdcc9c5_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Cape Manzamo', '$$', 75, 'https://live.staticflickr.com/3458/3817732170_2cc5b7e01a_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Shuri Castle', '$', 75, 'https://live.staticflickr.com/65535/49797889751_c0284f842c_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Arashiyama Bamboo Grove', '$$', 76, 'https://muza-chan.net/aj/poze-weblog3/arashiyama-bamboo-groves-big.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Kinkaku-ji (Golden Pavilion', '$', 76, 'https://live.staticflickr.com/4225/34036736784_92c2d270c7_b.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Haeundae Beach', '$', 77, 'https://upload.wikimedia.org/wikipedia/commons/4/49/Korea-Busan-Haeundae-Beach-04.jpg');
INSERT INTO attractions(id, name, general_cost, destination_id, photo) VALUES (DEFAULT, 'Gamecheon Culture Village', '$', 77, 'https://3.bp.blogspot.com/-AxfPlrXOs2k/WsIILKH0-NI/AAAAAAAAKHw/JqMtJ8arL6kqB9LMtbNHu_9dq4CJMZCngCLcBGAs/s1600/DSC02904.JPG');


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

--Users Table
INSERT INTO users (id, email, name, given_name)VALUES ('googleid1', 'john321@gmail.com', 'John Doe', 'John');
INSERT INTO users (id, email, name, given_name)VALUES ('googleid2', 'jane456@gmail.com', 'Jane Smith', 'Jane');
INSERT INTO users (id, email, name, given_name)VALUES ('googleid3', 'mark789@gmail.com', 'Mark Johnson', 'Mark');
INSERT INTO users (id, email, name, given_name, image_url)VALUES ('105855342383549276574', 'ericdirr92@gmail.com', 'Eric Dirr', 'Eric', 'https://lh3.googleusercontent.com/a/AAcHTtdsgOzGN0sS6h44hyluU65sQxkVc2J9bWqolbDGhN5d=s96-c');
INSERT INTO users (id, email, name, given_name, image_url)VALUES ('115213608802180447633', 'dayanasenat@gmail.com', 'Dayana Senat', 'Dayana', 'https://lh3.googleusercontent.com/a/AAcHTtdkUWFhTwSLvV-WY2d0ucLyC7di36gotsckXTVbODZVQco=s96-c');
INSERT INTO users (id, email, name, given_name, image_url)VALUES ('109872714042791085100', 'asadrm63@gmail.com', 'Asadur Rahman', 'Asadur', 'https://lh3.googleusercontent.com/a/AAcHTteD7Ajrkmz3zjIxZZQiQEpfRsUOKaL_flBPr_hPAT15=s96-c');
INSERT INTO users (id, email, name, given_name, image_url)VALUES ('100316119636052029906', 'judahbelgrave@gmail.com', 'Judah Belgrave', 'Judah', 'https://lh3.googleusercontent.com/a/AAcHTtd3_k21UcuYCM0u1tpDo55e4AsFOT2L90ku0gmsvs1V3g=s96-c');
INSERT INTO users (id, email, name, given_name, image_url)VALUES ('100019475106698487853', 'julietvorbe11@gmail.com', 'Juliet Vorbe', 'Juliet', 'https://lh3.googleusercontent.com/a/AAcHTtedg_s6aciR9CIx5ErLWauOVrB5583ho_Pc46SC1YeU04Q=s96-c');

--Saved Trips Table
INSERT INTO saved_trips (id, name, destination_id, user_id, date) VALUES (DEFAULT, 'Trip to Bali', 3, 'googleid1', '2020-08-15');
INSERT INTO saved_trips (id, name, destination_id, user_id, date) VALUES (DEFAULT, 'Trip to Paris', 1, 'googleid2', '2023-08-11');
INSERT INTO saved_trips (id, name, destination_id, user_id, date) VALUES (DEFAULT, 'Trip to Singapore', 33, 'googleid1', '2024-03-25');

--Attractions-Trips Table
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 1, 2);
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 2, 2);
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 3, 2);
INSERT INTO attractions_trips(id, attraction_id, trip_id) VALUES (DEFAULT, 8, 1);

--Matching user id with Saved Trip
INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, 1, 'googleid1');
INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, 2, 'googleid2');
INSERT INTO users_saved_trips (id, trip_id, user_id) VALUES (DEFAULT, 3, 'googleid1');