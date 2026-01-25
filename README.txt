
Readmissions within 30 days are a key metric in healthcare for evaluating treatment efficacy, quality of care, and patient outcomes. This project analyses inpatient data for patients with diabetes from 130 US hospitals over a ten-year period, with the goal of identifying trends and factors associated with 30-day readmissions. The analysis focuses on demographic, clinical, and hospital utilisation variables to provide insights into patterns of readmission and opportunities for improving care delivery.



The key questions of this project are:

Do gender, race, and age have an effect on patient readmission?

Do longer hospital stays increase chance of readmission?

Do patients on more medication get admitted more?

Impact of insulin user on readmission.

Dataset source :  "https://www.kaggle.com/datasets/jimschacko/10-years-diabetes-dataset"
Rows: 101763
Schema: {"id" TEXT,
        "encounter_id" TEXT,
        "patient_nbr" TEXT,
        "race" TEXT,
        "gender" TEXT, 
        "age" TEXT,
        "weight" TEXT, 
        "admission_type_id" TEXT,
        "discharge_disposition_id" TEXT, 
        "admission_source_id" TEXT, 
        "time_in_hospital" TEXT,
        "payer_code" TEXT,
        "medical_specialty" TEXT,
        "num_lab_procedures" TEXT, 
        "num_procedures" TEXT, 
        "num_medications" TEXT,
        "number_outpatient" TEXT, 
        "number_emergency" TEXT,
        "number_inpatient" TEXT,
        "diag_1" TEXT,
        "diag_2" TEXT, 
        "diag_3" TEXT, 
        "number_diagnoses" TEXT, 
        "max_glu_serum" TEXT,
        "A1Cresult" TEXT, 
        "metformin" TEXT, 
        "repaglinide" TEXT, 
        "nateglinide" TEXT,
        "chlorpropamide" TEXT, 
        "glimepiride" TEXT,
        "acetohexamide" TEXT,
        "glipizide" TEXT,
        "glyburide" TEXT, 
        "tolbutamide" TEXT, 
        "pioglitazone" TEXT, 
        "rosiglitazone" TEXT,
        "acarbose" TEXT, 
        "miglitol" TEXT,
        "troglitazone" TEXT, 
        "tolazamide" TEXT,
        "examide" TEXT,
        "citoglipton" TEXT, 
        "insulin" TEXT,
        "glyburide.metformin" TEXT,
        "glipizide.metformin" TEXT, 
        "glimepiride.pioglitazone" TEXT,
        "metformin.rosiglitazone" TEXT, 
        "metformin.pioglitazone" TEXT,
        "change" TEXT, 
        "diabetesMed" TEXT, 
        "readmitted" TEXT
        }

-- issues

Numeric columns stored as text.
Missing Race rows 

Cleaned Dataset schema: 
    {id INTEGER PRIMARY KEY,
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
    readmitted TEXT, 
    age_mid_range INTEGER
    }
