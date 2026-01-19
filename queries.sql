— clean data by removing '?'

UPDATE diabetes
SET
    race = NULL
WHERE race = '?';

UPDATE diabetes
SET
    payer_code = NULL
WHERE payer_code = '?';

UPDATE diabetes
SET
    medical_specialty = NULL
WHERE medical_specialty = '?';

— remove invalid genders

DELETE FROM diabetes 
 WHERE gender = 'Unknown/Invalid';

— remove duplicates

DELETE FROM diabetes
WHERE rowid not in (SELECT MIN(rowid) from diabetes GROUP BY encounter_id);

— clean age group column. 

UPDATE diabetes
SET age = LTRIM(age,'[');

UPDATE diabetes
SET age = RTRIM(age,')');

— create new table with correct datatypes

create table diabetes (
    id INTEGER PRIMARY KEY,
    encounter_id INTEGER,
    patient_nbr INTEGER,
    race TEXT,
    gender TEXT,
    age TEXT,
    time_in_hospital INTEGER,
    num_lab_procedures INTEGER,
    num_procedures INTEGER,
    num_medications INTEGER,
    number_diagnoses INTEGER,
    insulin TEXT,
    readmitted TEXT);

INSERT INTO diabetes (id,
encounter_id,
patient_nbr,
race,
gender,
age,
time_in_hospital,
num_lab_procedures,
num_procedures,
num_medications,
number_diagnoses,
insulin,
readmitted)
SELECT id,
encounter_id,
patient_nbr,
race,
gender,
age,
time_in_hospital,
num_lab_procedures,
num_procedures,
num_medications,
number_diagnoses,
insulin,
readmitted
from diabetes_old;

UPDATE diabetes
set age_mid_range = CASE WHEN age = '0-10' THEN 5
WHEN age = '10-20' THEN 15
WHEN age = '20-30' THEN 25
WHEN age = '30-40' THEN 35
WHEN age = '40-50' THEN 45
WHEN age = '50-60' THEN 55
WHEN age = '60-70' THEN 65
WHEN age = '70-80' THEN 75
WHEN age = '80-90' THEN 85
WHEN age = '90-100' THEN 95 END;



--Creating datasets

-- demographic assessment
SELECT age,gender,race,count(*) as 'patient number' from diabetes
group by age,race,gender;

--age readmission
SELECT 
    age,
    age_mid_range,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS 'readmitted <30',
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / count(*), 2) AS readmission_rate
FROM diabetes
GROUP BY age
ORDER BY age_mid_range ASC;

-- medication readmition
SELECT
    CASE 
        WHEN num_medications < 5 THEN 'Low'
        WHEN num_medications BETWEEN 5 AND 10 THEN 'Medium'
        ELSE 'High'
    END AS medication_group,
    COUNT(*) AS total_cases,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS readmission_rate
FROM diabetes
GROUP BY medication_group;

-- insulin output
SELECT
    insulin,
    COUNT(*) AS total_patients,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)/ COUNT(*), 4
    ) AS readmission_rate
FROM diabetes
GROUP BY insulin;

--gender demographic output
SELECT 
    gender,

    COUNT(*) AS total_cases,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS 'readmitted <30',
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / count(*), 2) AS readmission_rate
FROM diabetes
GROUP BY gender;


-- using CTE for avg length of stay

WITH age_group_stats AS (
    SELECT 
        age_mid_range,
        ROUND(AVG(time_in_hospital)) AS avg_los,
        COUNT(*) AS num_patients
    FROM diabetes
    GROUP BY age_mid_range
)
SELECT *
FROM age_group_stats
WHERE num_patients > 50
ORDER BY avg_los DESC;







