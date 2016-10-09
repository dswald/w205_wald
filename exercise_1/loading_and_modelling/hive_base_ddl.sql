DROP TABLE hospitals;
CREATE EXTERNAL TABLE IF NOT EXISTS hospitals (
provider_id INT,
hospital_name STRING,
hospital_address STRING,
hospital_city STRING,
hospital_state STRING,
hospital_zip INT,
hospital_county STRING,
hospital_phone INT,
hospital_type STRING,
hospital_own STRING,
hospital_er STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';


DROP TABLE measures;
CREATE EXTERNAL TABLE IF NOT EXISTS measures (
measure_name STRING,
measure_id STRING,
measure_startquart STRING,
measure_startdate STRING,
measure_endquart STRING,
measure_enddate STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE IF NOT EXISTS measures (
provider_id INT,
hospital_name STRING,
hospital_address STRING,
hospital_city STRING,
hospital_state STRING,
hospital_zip INT,
hospital_county STRING,
hospital_phone INT,
condition STRING,
measure_id STRING,
measure_name STRING,
care_score STRING,
care_sample STRING,
care_footnote STRING,
care_start STRING,
care_end STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE IF NOT EXISTS measures (
provider_id INT,
hospital_name STRING,
hospital_address STRING,
hospital_city STRING,
hospital_state STRING,
hospital_zip INT,
hospital_county STRING,
hospital_phone INT,
measure_name STRING,
measure_id STRING,
national_compare STRING,
readmission_sample STRING,
readmission_score FLOAT,
readmission_low FLOAT,
readmission_high FLOAT,
readmission_footnote STRING,
readmission_start STRING,
readmission_end STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE survey;
CREATE EXTERNAL TABLE IF NOT EXISTS measures (
provider_id INT,
hospital_name STRING,
hospital_address STRING,
hospital_city STRING,
hospital_state STRING,
hospital_zip INT,
hospital_county STRING,
Communication_with_Nurses_Achievement_pts STRING,
Communication_with_Nurses_Improvement_pts STRING,
Communication_with_Nurses_Dimension_score STRING,
Communication_with_Doctors_Achievement_pts STRING,
Communication_with_Doctors_Improvement_pts STRING,
Communication_with_Doctors_Dimension_score STRING,
Responsiveness_of_Hospital_Staff__Achievement_pts STRING,
Responsiveness_of_Hospital_Staff_Improvement_pts STRING,
Responsiveness_of_Hospital_Staff_Dimension_score STRING,
Pain_Management_Achievement_pts STRING,
Pain_Management_Improvement_pts STRING,
Pain_Management_Dimension_score STRING,
Communication_about_Medicines_Achievement_pts STRING,
Communication_about_Medicines_Improvement_pts STRING,
Communication_about_Medicines_Dimension_score STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_pts STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_pts STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_score STRING,
Discharge_Information_Achievement_pts STRING,
Discharge_Information_Improvement_pts STRING,
Discharge_Information_Dimension_score STRING,
Overall_Hospital_Achievement_pts STRING,
Overall_Hospital_Improvement_pts STRING,
Overall_Hospital_Dimension_score STRING,
survey_baseline STRING,
survey_consistency STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';
