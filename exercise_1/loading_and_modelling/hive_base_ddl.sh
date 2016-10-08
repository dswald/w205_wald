#DDL statements to create tables

#DDL to create hostpitals
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (
  provider_id INT,
  hospital_name STRING,
  hospital_address STRING,
  hospital_state STRING
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/home/w205/hospital_compare';

#DDL to create measures
DROP TABLE measures;
CREATE EXTERNAL TABLE measures (
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
LOCATION '/home/w205/hospital_compare';

#DDL to create effective_care
DROP TABLE effective_care;
CREATE EXTERNAL TABLE measures (
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
LOCATION '/home/w205/hospital_compare';

#DDL to create readmissions
DROP TABLE readmissions;
CREATE EXTERNAL TABLE measures (
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
LOCATION '/home/w205/hospital_compare';

#DDL to create survey
DROP TABLE survey;
CREATE EXTERNAL TABLE measures (
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
LOCATION '/home/w205/hospital_compare';
