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
SCIP_Inf_1_Performance_Rate STRING,
SCIP_Inf_1_Achievement_Points STRING,
SCIP_Inf_1_Improvement_Points STRING,
SCIP_Inf_1_Measure_Score STRING,
SCIP_Inf_2_Performance_Rate STRING,
SCIP_Inf_2_Achievement_Points STRING,
SCIP_Inf_2_Improvement_Points STRING,
SCIP_Inf_2_Measure_Score STRING,
SCIP_Inf_3_Performance_Rate STRING,
SCIP_Inf_3_Achievement_Points STRING,
SCIP_Inf_3_Improvement_Points STRING,
SCIP_Inf_3_Measure_Score STRING,
SCIP_Inf_4_Performance_Rate STRING,
SCIP_Inf_4_Achievement_Points STRING,
SCIP_Inf_4_Improvement_Points STRING,
SCIP_Inf_4_Measure_Score STRING,
SCIP_Inf_9_Performance_Rate STRING,
SCIP_Inf_9_Achievement_Points STRING,
SCIP_Inf_9_Improvement_Points STRING,
SCIP_Inf_9_Measure_Score STRING,
Procedure_Score STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';
