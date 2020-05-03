USE boxer_data;

#Shows the boxers who competed against each other at a specific event
SELECT 
(SELECT boxer_name FROM boxer WHERE fk_fighter1_id = pk_boxer_id) AS 'Fighter 1',
(SELECT boxer_name FROM boxer WHERE fk_fighter2_id = pk_boxer_id) AS 'Fighter 2',
location_name AS 'Location',
bout_date AS 'Date'
FROM bout
LEFT JOIN fight_location ON pk_location_id = fk_location_id
WHERE bout_date = '2019-10-23' AND location_name = 'York Hall';

# Finds the fight record and the win percentage of each fighter in the heavyweight division
SELECT weight_class AS 'Weight Class', boxer_name AS "Boxer",
@wins := (SELECT COUNT(fk_winner_id) FROM bout WHERE fk_winner_id = pk_boxer_id) AS 'Wins',
@losses := (SELECT COUNT(fk_winner_id) FROM bout WHERE (fk_fighter1_id = pk_boxer_id OR fk_fighter2_id = pk_boxer_id) AND pk_boxer_id != fk_winner_id) AS 'Losses',
ROUND((@wins/(@wins+@losses))*100) AS 'Win Percentage'
FROM boxer
WHERE weight_class = "Heavyweight";

#Finds what boxers in the lightweight division hold what belts
SELECT boxer_name, belt_title, belt.weight_class
FROM boxer
JOIN boxer_belt ON pk_boxer_id = fk_boxer_id
JOIN belt ON pk_belt_id = fk_belt_id
GROUP BY weight_class, belt_title
HAVING weight_class = 'Lightweight';

#Finds how many fighters each trainer has in order from most to least
SELECT trainer_name AS 'Trainer',
(SELECT COUNT(pk_boxer_id) FROM boxer WHERE fk_trainer_id = pk_trainer_id) AS 'Number of Fighters'
FROM trainer
ORDER BY (SELECT COUNT(pk_boxer_id) FROM boxer WHERE fk_trainer_id = pk_trainer_id) DESC
LIMIT 4;

#Finds the fighter with the longest reach in each weightclass
SELECT boxer_name AS 'Boxer', MAX(wingspan) AS 'Reach in cm', weight_class AS 'Weight Class'
FROM boxer
GROUP BY weight_class;

#Finds what boxers train at Old School Boxing gym
SELECT boxer_name AS 'Boxer'
FROM boxer
WHERE fk_trainer_id 
IN(SELECT pk_trainer_id
FROM trainer 
WHERE fk_gym_id 
IN(SELECT pk_gym_id 
FROM gym
WHERE gym_name = 'Old School Boxing')
); 

#Finds what fighters a specific promoter has
SELECT promoter_name AS 'Promoter', boxer_name AS 'Boxer'
FROM boxer
JOIN promoter ON pk_promoter_id = fk_promoter_id
WHERE promoter_name LIKE 'Anthony%';

#Find how many belts each gym has
SELECT gym_name AS 'Gym',
COUNT(gym_name) AS 'Number of Belts'
From gym
JOIN trainer ON pk_gym_id = fk_gym_id
JOIN boxer ON pk_trainer_id = fk_trainer_id
JOIN boxer_belt On pk_boxer_id = fk_boxer_id
GROUP BY gym_name
;

#Find the most recent bouts that a boxer has and gives the result
SELECT boxer_name AS 'Boxer',
(SELECT location_name FROM fight_location WHERE fk_location_id = pk_location_id) AS 'Location',
bout_date as 'Date',
IF(pk_boxer_id = fk_winner_id, 'Won', 'Loss') AS 'Result'
From boxer
LEFT JOIN bout ON pk_boxer_id = fk_fighter1_id OR pk_boxer_id = fk_fighter2_id
WHERE boxer_name = 'Gennady Golovkin'
ORDER BY bout_date DESC
LIMIT 3;

#Finds the number of KOs and the KO percentage in each weight class
SELECT weight_class,
@ko := SUM(IF(ko,1,0)) AS 'KO',
ROUND((@ko / (@ko + SUM(IF(ko,0,1)))) *100) AS 'KO Percentage'
FROM boxer
JOIN bout ON pk_boxer_id = fk_winner_id
GROUP BY weight_class;