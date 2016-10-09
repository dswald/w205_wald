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
measure_id INT,
measure_name STRING,
measure_startdate DATE,
measure_enddate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/home/w205/hospital_compare/measures';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE IF NOT EXISTS measures (
provider_id INT,
measure_id INT,
care_score INT,
care_sample STRING,
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
measure_id INT,
readmission_score FLOAT,
readmission_low FLOAT,
readmission_high FLOAT,
readmission_sample STRING,
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
survey_baseline INT,
survey_consistency INT,
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';
