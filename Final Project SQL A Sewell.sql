-- This SQL database is a sample of 1182 students from Delhi responding to questions about their learning habits/changes during lockdown.

-- Retrieve everything from the database working with.
SELECT * FROM finalproject.education;

-- Show student ID numbers and variety of ages.
SELECT ID, Age_of_subject FROM finalproject.education;

-- Find the average age of students that took part.
SELECT AVG (age_of_subject) AS 'Average Age' FROM finalproject.education;

-- How many students rated the online class experience as poor or very poor? 
SELECT ID, Rating_of_online_class_experience
FROM finalproject.education
WHERE Rating_of_online_class_experience IN ('very poor','poor');
-- Answer to above is 442 students.

-- How does time spent on self study compare to time spent on social media? (Find averages)

-- Number of varieties of social media platforms used during this period?
SELECT COUNT(DISTINCT prefered_social_media_platform) AS 'Number of Social Media Platforms' FROM finalproject.education;

-- Average time spent on self study by age
SELECT age_of_subject, AVG(time_spent_on_self_study) AS 'Average time spent on self study by age' FROM finalproject.education GROUP BY age_of_subject;
-- Not a clear trend, however those that were aged 20+ spent an average of 3 hrs or more on self study.
-- Those that fall into the secondary ages (15-17) also spent an average of 3 hrs or more on self study.

-- Average time spent on social media by age
SELECT age_of_subject, AVG(time_spent_on_social_media) AS 'Average time spent on social media by age' FROM finalproject.education
GROUP BY age_of_subject;
-- Other than 18 and 19 year olds, all other students who averaged 2 hrs+ on social media were over 20 years old.

-- Students experience ratings via their age. Does a students age impact on their overall experience?

SELECT rating_of_online_class_experience, age_of_subject,
CASE
WHEN Rating_of_Online_Class_experience = 'poor' THEN 'Not great experience'
WHEN Rating_of_Online_Class_experience = 'very poor' THEN 'Terrible experience'
WHEN Rating_of_Online_Class_experience = 'excellent' THEN 'Great experience'
WHEN Rating_of_Online_Class_experience = 'good' THEN 'Good experience'
WHEN Rating_of_Online_Class_experience = 'average' THEN 'Okay experience'
ELSE 'Did not respond to experience'
END AS 'Experience ratings'
FROM finalproject.education; 
-- Those that had a good/great experience of online learning are generally younger ages, however there isn't a clear correlation
-- responses are mixed. A high frequency of older students rated their experience as poor or very poor.

SELECT age_of_subject,
CASE
WHEN age_of_subject BETWEEN 7 AND 14 THEN 'Primary Students'
WHEN age_of_subject BETWEEN 15 AND 17 THEN 'Secondary Students'
WHEN age_of_subject BETWEEN 18 AND 24 THEN 'Higher Education Students'
ELSE 'Mature Students'
END AS 'Student Categories'
FROM finalproject.education;

