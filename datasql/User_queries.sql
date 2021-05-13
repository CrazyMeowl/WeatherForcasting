USE wherethefourcasting;

-- Drop existing tables
DROP TABLE IF EXISTS user_authen;
DROP TABLE IF EXISTS user_emails;
DROP TABLE IF EXISTS user_phone;
DROP TABLE IF EXISTS user_profileimages;
DROP TABLE IF EXISTS user_activities;

-- Create Tables
CREATE TABLE user_authen (
	userID VARCHAR(30) NOT NULL,
    username VARCHAR(30),
    user_pw VARCHAR(30),
    locationID INT NOT NULL,
    
    primary key (userID),
    foreign key (locationID) references location(locationID)
    );

CREATE TABLE user_emails (
	email VARCHAR(60),
    userID VARCHAR(30) NOT NULL,
    
    primary key (email),
    foreign key (userID) references user_authen(userID)
    );
    
CREATE TABLE user_phones (
	phone BIGINT,
    userID VARCHAR(30) NOT NULL,
    
    primary key (phone),
    foreign key (userID) references user_authen(userID)
    );
    
CREATE TABLE user_profileimages (
	userID VARCHAR(30) NOT NULL,
    image_date DATE NOT NULL,
    filename VARCHAR(50) NOT NULL,
    
    primary key (userID, filename),
    foreign key (userID) references user_authen(userID)
    );

CREATE TABLE user_activities (
	userID VARCHAR(30) NOT NULL,
    search_date DATE NOT NULL,
    search_location INT NOT NULL,
    
    primary key (userID, search_date, search_location),
    foreign key (userID) references user_authen(userID)
    );




-- Insert data
-- Authen    
INSERT INTO user_authen VALUES ('@chillisauce', 'Chillisauce', '1233456abc', 414495);
INSERT INTO user_authen VALUES ("@crazymeowl", "Lido", "1233456789", 414495);
INSERT INTO user_authen VALUES ("@billfashion", "Bill", "abc123456", 414495);
INSERT INTO user_authen VALUES ("@nhattan", "Link", "1233456789", 414495);
INSERT INTO user_authen VALUES ("@louish", "Louish", "zxccvb123", 300597);
INSERT INTO user_authen VALUES ("@gigguk", "Gigguk", "asdfg321", 327659);
INSERT INTO user_authen VALUES ("@teamcherry", "Cherry", "qwertuabc", 328328);
INSERT INTO user_authen VALUES ("@chillyroom", "Chilly Room", "hahahha123", 347625);
INSERT INTO user_authen VALUES ("@ubisoft", "Ubisoft", "poiuyt123", 328328);
INSERT INTO user_authen VALUES ("@brackey", "Brackey", "lkjhgf321", 328328);
INSERT INTO user_authen VALUES ("@yoasobi", "Yoasobi", "trygfhbnv098", 328328);
INSERT INTO user_authen VALUES ("@donaldtrump", "Donald Trump", "donalddonald", 349727);


-- Emails
INSERT INTO user_emails VALUES ("chillisaucery@gmail.com", "@chillisauce");
INSERT INTO user_emails VALUES ("luuhienlong201@gmail.com", "@chillisauce");
INSERT INTO user_emails VALUES ("ITITIU190haha@student.emo.hcmiu.us", "@chillisauce");
INSERT INTO user_emails VALUES ("randomlygenerated432512@gmail.com", "@chillisauce");
INSERT INTO user_emails VALUES ("hollowknight@gmail.business.com", "@teamcherry");
INSERT INTO user_emails VALUES ("silksong@gmail.business.com", "@teamcherry");
INSERT INTO user_emails VALUES ("donaldtrump@gmail.com", "@donaldtrump");
INSERT INTO user_emails VALUES ("donaldtrumpoffical@gmail.com", "@donaldtrump");
INSERT INTO user_emails VALUES ("donaldtrumpactualoffical@gmail.com", "@donaldtrump");


-- Phones
INSERT INTO user_phones VALUES (0912444555, "@chillisauce");
INSERT INTO user_phones VALUES (0912444666, "@chillisauce");
INSERT INTO user_phones VALUES (0123456789, "@chillisauce");
INSERT INTO user_phones VALUES (0912555999, "@crazymeowl");
INSERT INTO user_phones VALUES (0912111555, "@crazymeowl");
INSERT INTO user_phones VALUES (0912951847, "@yoasobi");




-- Profile Images
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-12', "abc.png");
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-12', "hornet.png");
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-12', "ricardo.png");
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-10', "arknights.png");
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-12', "trainerred.png");
INSERT INTO user_profileimages VALUES ("@chillisauce", '2021-05-9', "madoka.png");
INSERT INTO user_profileimages VALUES ("@donaldtrump", '2021-05-5', "donaldtrump.png");
INSERT INTO user_profileimages VALUES ("@donaldtrump", '2021-05-7', "donalddonald.png");
INSERT INTO user_profileimages VALUES ("@donaldtrump", '2021-05-9', "trumptrump.png");
INSERT INTO user_profileimages VALUES ("@gigguk", '2021-05-1', "domestic.png");
INSERT INTO user_profileimages VALUES ("@gigguk", '2021-05-12', "electricalengineer.png");


-- Activities
INSERT INTO user_activities VALUES ("@chillisauce", '2021-04-27', 623);
INSERT INTO user_activities VALUES ("@chillisauce", '2021-04-27', 178087);
INSERT INTO user_activities VALUES ("@chillisauce", '2021-04-27', 327659);
INSERT INTO user_activities VALUES ("@chillisauce", '2021-04-28', 300597);
INSERT INTO user_activities VALUES ("@billfashion", '2021-04-27', 623);
INSERT INTO user_activities VALUES ("@billfashion", '2021-04-27', 178087);
INSERT INTO user_activities VALUES ("@donaldtrump", '2021-04-27', 327659);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-28', 300597);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-29', 178087);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-29', 208971);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-29', 230276);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-29', 300597);
INSERT INTO user_activities VALUES ("@nhattan", '2021-04-29', 327659);

