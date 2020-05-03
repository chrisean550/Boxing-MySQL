CREATE DATABASE IF NOT EXISTS boxer_data;
USE boxer_data;

CREATE TABLE IF NOT EXISTS Boxer(
pk_boxer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
boxer_name VARCHAR(45) NOT NULL,
age INT NOT NULL,
weight_class VARCHAR(45) NOT NULL,
wingspan DOUBLE NOT NULL,
nationality VARCHAR(45) NOT NULL,
fk_promoter_id INT NOT NULL,
fk_trainer_id INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Bout(
pk_bout_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fk_fighter1_id INT NOT NULL,
fk_fighter2_id INT NOT NULL,
fk_winner_id INT,
ko BOOLEAN NOT NULL,
bout_date DATE NOT NULL,
fk_location_id INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Fight_Location(
pk_location_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
st_adress VARCHAR(45) NOT NULL,
city VARCHAR(45) NOT NULL,
country VARCHAR(45) NOT NULL,
location_name VARCHAR(45) NOT NULL
);
CREATE TABLE IF NOT EXISTS Trainer(
pk_trainer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
trainer_name VARCHAR(45) NOT NULL,
fk_gym_id INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Belt(
pk_belt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
belt_title VARCHAR(45) NOT NULL,
weight_class VARCHAR(45) NOT NULL
);
CREATE TABLE IF NOT EXISTS Gym(
pk_gym_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
gym_name VARCHAR(45) NOT NULL,
st_adress VARCHAR(45) NOT NULL,
city VARCHAR(45) NOT NULL,
country VARCHAR(45) NOT NULL
);
CREATE TABLE IF NOT EXISTS Promoter(
pk_promoter_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
promoter_name VARCHAR(45) NOT NULL,
age INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Boxer_Belt(
pk_boxer_belt INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fk_belt_id INT NOT NULL,
fk_boxer_id INT NOT NULL
);

ALTER TABLE Boxer
ADD FOREIGN KEY (fk_promoter_id)
REFERENCES Promoter(pk_promoter_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Boxer
ADD FOREIGN KEY (fk_trainer_id)
REFERENCES Trainer(pk_trainer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Bout
ADD FOREIGN KEY (fk_fighter1_id)
REFERENCES Boxer(pk_boxer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Bout
ADD FOREIGN KEY (fk_fighter2_id)
REFERENCES Boxer(pk_boxer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Bout
ADD FOREIGN KEY (fk_winner_id)
REFERENCES Boxer(pk_boxer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Bout
ADD FOREIGN KEY (fk_location_id)
REFERENCES Fight_Location(pk_location_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Trainer
ADD FOREIGN KEY (fk_gym_id)
REFERENCES Gym(pk_gym_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Boxer_Belt
ADD FOREIGN KEY (fk_boxer_id)
REFERENCES Boxer(pk_boxer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Boxer_Belt
ADD FOREIGN KEY (fk_belt_id)
REFERENCES Belt(pk_belt_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

#Belts
INSERT INTO Belt(belt_title, weight_class)
VALUES("IBF", "Heavyweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("IBF", "Middleweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("IBF", "Lightweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBA", "Heavyweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBA", "Middleweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBA", "Lightweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBO", "Heavyweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBO", "Middleweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBO", "Lightweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBC", "Heavyweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBC", "Middleweight");
INSERT INTO Belt(belt_title, weight_class)
VALUES("WBC", "Lightweight");

#Fight Locations
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("3799 S Las Vegas Blvd", "Las Vegas", "United States", "MGM Grand");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("4 Pennsylvania Plaza", "New York", "United States", "Madison Square Garden");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("4505 S Maryland Pkwy", "Las Vegas", "United State", "Thomas & Mack Center");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("General Roxas Ave", "Quezon City", "Philippines", "Araneta Coliseum");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("1314 N. Broad St", "Philadelphia", "United States", "Blue Horizon");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("24115 Cd dek Carmen", "Playa Norte", "Mexico", "Domo del Mar");
INSERT INTO Fight_Location(st_adress, city, country, location_name)
VALUES("5 Old Ford Rd", "London", "United Kingdom", "York Hall");

#Promoters 
INSERT INTO Promoter(promoter_name, age)
VALUES("Cilcilia Robinson", 34);
INSERT INTO Promoter(promoter_name, age)
VALUES("Derek Allens", 29);
INSERT INTO Promoter(promoter_name, age)
VALUES("John Doe", 45);
INSERT INTO Promoter(promoter_name, age)
VALUES("Jermaine Butler", 26);
INSERT INTO Promoter(promoter_name, age)
VALUES("Anthony Kowal", 40);
INSERT INTO Promoter(promoter_name, age)
VALUES("James Tanner", 46);
INSERT INTO Promoter(promoter_name, age)
VALUES("Stephen Patterson", 49);

#Gyms
INSERT INTO Gym(gym_name, st_adress, city, country)
Values("Pro Boxing Gym","123 Academy St","Pittsburgh","United States");
INSERT INTO Gym(gym_name, st_adress, city, country)
Values("Old School Boxing"," 6657 Westbrook Rd","Miami","United States");
INSERT INTO Gym(gym_name, st_adress, city, country)
Values("U.S.S Fight Academy","893 Meadows Dr","Longbeach"," United States");
INSERT INTO Gym(gym_name, st_adress, city, country)
Values("Bronson House","772 Wild Rd","Puebla","Mexico");
INSERT INTO Gym(gym_name, st_adress, city, country)
Values("World Class Boxing","2233 Eastern Dr","Manchester","United Kingdom");

#Trainers
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Abel Sanchez", 4);
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Virgil Hunter", 2);
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Freddie Roach", 3);
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Robert Garcia", 4);
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Eddie Futch", 5);
INSERT INTO Trainer( trainer_name, fk_gym_id)
VALUES("Abgelo Dundee", 1);

#Heavy Weights
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Tyson Fury", 31, "Heavyweight", 85, "United Kingdom", 1, 5);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Deontay Wilder", 34, "Heavyweight", 83, "United States", 2, 4);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Anthony Joshua", 30, "Heavyweight", 82, "England", 3, 6);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Andy Ruiz Jr", 30, "Heavyweight", 74, "United States", 4, 2);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Wladimir Klitschko", 44, "Heavyweight", 81, "Ukrain", 5, 1);

#Middle Weight
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Canelo Alverez", 29, "Middleweight", 70.5, "Mexico",5, 6);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Gennady Golovkin", 37, "Middleweight", 70, "Kazakhstan", 4, 2);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Vasyl Lomachenko", 32, "Middleweight", 65.5, "Ukrain", 3, 3);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Mikey Garcia", 32, "Middleweight", 68, "United States", 2, 4);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Terence Crawford", 32, "Middleweight", 74, "United States", 1, 5 );

#Light Weight
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Manny Pacquiao", 41, "Lightweight", 67, "Philippines", 1, 1);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Andre Ward", 36, "Lightweight", 71, "United States", 2, 2);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Naoya Inoue", 26, "Lightweight", 67, "Japan", 3, 3);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Kell Brook", 33, "Lightweight", 69.5, "Britain", 4, 6);
INSERT INTO Boxer( boxer_name, age, weight_class, wingspan, nationality, fk_promoter_id, fk_trainer_id)
VALUES("Ryan Garcia", 21, "Lightweight", 70, "United States", 5, 5);

#Boxer_Belt
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(1,1);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(4,4);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(7,1);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(10,2);

INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(2,6);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(5,7);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(8,7);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(11,8);

INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(3,15);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(6,12);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(9,15);
INSERT INTO Boxer_Belt(fk_belt_id, fk_boxer_id)
VALUES(12,11);

#Heavyweight Bouts
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(1, 2, 1, true, "2014-03-12", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(1, 3, 1, true, "2018-12-09", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(1, 4, 1, true, "2015-06-06", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(1, 5, 1, false, "2017-06-11", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(1, 3, 1, true, "2019-10-23", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(2, 3, 3, true, "2019-01-29", 6 );
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(2, 4, 2, false, "2015-10-17", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(2, 5, 2, false, "2017-08-30", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(3, 4, 4, true, "2020-01-25", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(3, 5, 3, true, "2018-06-14", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(4, 2, 4, true, "2017-07-23", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(4, 1, 1, false, "2016-04-23", 3);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(4, 5, 5, false, "2017-11-12", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(5, 3, 5, true, "2014-03-12", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(5, 4, 5, true, "2019-09-17", 3);

#Middleweight Bouts
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(6, 7, 6, true, "2014-03-12", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(6, 8, 6, false, "2018-12-09", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(6, 10, 10, false, "2015-06-06", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(6, 9, 6, false, "2017-06-11", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(7, 10, 10, true, "2019-10-23", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(7, 9, 7, false, "2019-01-29", 6 );
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(7, 8, 7, true, "2015-10-17", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(7, 8, 7, false, "2017-08-30", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(8, 9, 8, false, "2020-01-25", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(8, 10, 8, true, "2018-06-14", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(8, 6, 8, false, "2017-07-23", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(9, 8, 9, true, "2016-04-23", 3);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(9, 7, 9, false, "2017-11-12", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(10, 6, 6, false, "2014-03-12", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(10, 9, 10, true, "2019-09-17", 3);

#Lightweight
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(11, 14, 11, false, "2014-03-12", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(11, 13, 13, false, "2018-12-09", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(11, 14, 11, true, "2015-06-06", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(11, 12, 12, false, "2017-06-11", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(11, 13, 11, false, "2019-10-23", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(12, 13, 13, true, "2019-01-29", 6 );
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(12, 14, 12, false, "2015-10-17", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(12, 15, 12, false, "2017-08-30", 1);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(13, 14, 14, true, "2020-01-25", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(13, 12, 12, false, "2018-06-14", 5);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(14, 12, 14, true, "2017-07-23", 2);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(14, 13, 14, false, "2016-04-23", 3);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(14, 15, 15, false, "2017-11-12", 7);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(15, 12, 15, true, "2014-03-12", 4);
INSERT INTO Bout(fk_fighter1_id, fk_fighter2_id, fk_winner_id, ko, bout_date, fk_location_id)
VALUES(15, 14, 14, false, "2019-09-17", 3);






