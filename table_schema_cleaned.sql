CREATE TABLE diabetes (
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
    readmitted TEXT, age_mid_range INTEGER);
