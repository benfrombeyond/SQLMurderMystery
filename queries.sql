-- GOAL: Find the report about the murder in question on Jan 15, 2018 in SQL City.
SELECT *
FROM crime_scene_report
WHERE type LIKE "murder"
AND city LIKE "SQL City"
AND date = 20180115
-- transcript: Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- GOAL: Identify witness on Northwestern Dr.
SELECT name
FROM person
WHERE address_street_name LIKE "Northwestern Dr"
ORDER BY address_number DESC
LIMIT 1 
-- name: Morty Schapiro

-- GOAL: Identify the witness named Annabel who lives somewhere on "Franklin Ave".
SELECT name
FROM person
WHERE address_street_name LIKE "Franklin Ave"
AND name LIKE "Annabel%"
-- name: Annabel Miller

--GOAL: Retrieve interviews from potential witnesses.
SELECT name, transcript
FROM interview join person
ON person_id = id
WHERE name LIKE "Kinsey Erickson"
OR name LIKE "Morty Schapiro"
OR name LIKE "Annabel Miller"
-- Morty Schapiro: I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
-- Annabel Miller: I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

-- GOAL: Identify owner of vehicle with partial plate "H42W".
SELECT name
FROM person JOIN drivers_license
ON person.license_id = drivers_license.id
WHERE plate_number LIKE "%H42W%"
-- names: Tushar Chandra, Jeremy Bowers, Maxine Whitely

-- GOAL: Narrow down suspect using gold gym membership starting with "48Z".
SELECT name
FROM get_fit_now_member
WHERE id LIKE "48Z%"
AND membership_status LIKE "gold"
-- names: Joe Germuska, Jeremy Bowers

-- GOAL: Confirm that Jeremy Bowers was at the gym at the same time as Annabel Miller on January 9th.
SELECT name, check_in_time, check_out_time
FROM get_fit_now_check_in JOIN get_fit_now_member
ON membership_id = id
WHERE check_in_date = 20180109
AND name LIKE "Annabel Miller"
OR name LIKE "Jeremy Bowers"
-- Jeremy Bowers: 1530 - 1700
-- Annabel Miller: 1600 - 1700

-- GOAL: Retrieve interview with Jeremy Bowers.
SELECT name, transcript
FROM interview JOIN person
ON person_id = id
WHERE name LIKE "Jeremy Bowers"
-- transcript: I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

-- GOAL: Identify the woman based on hair color, height, car, and attendance at SQL Symphony Concert.
SELECT name
FROM person JOIN drivers_license
ON person.license_id = drivers_license.id
JOIN facebook_event_checkin
ON facebook_event_checkin.person_id = person.id
WHERE height BETWEEN 64 AND 68
AND hair_color LIKE "red"
AND car_make LIKE "Tesla"
AND car_model LIKE "Model S"
AND date LIKE "201712%"
AND event_name LIKE "SQL Symphony Concert"
-- 3 entries for Miranda Priestly

-- GOAL: Retrieve interview with Miranda Priestly
SELECT name, transcript
FROM interview JOIN person
ON person_id = id
WHERE name LIKE "Miranda Priestly"
-- No data returned.

-- Confirm Jeremy Bowers as the killer.
-- Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime.

-- Confirm Miranda Priestly as "The real villain."
-- Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!
