DROP TABLE hospitals_lite;
CREATE TABLE hospitals_lite AS SELECT
provider_id,
hospital_name,
hospital_address,
hospital_city,
hospital_state,
hospital_zip FROM hospitals;

DROP TABLE measures_lite;
CREATE TABLE measures_lite AS SELECT
measure_id,
measure_name,
measure_startdate,
measure_enddate
FROM measures;

DROP TABLE effective_lite;
CREATE TABLE effective_lite AS SELECT
provider_id,
measure_id,
care_score,
care_start,
care_end
FROM effective_care;

DROP TABLE readmissions_lite;
CREATE TABLE readmissions_lite AS SELECT
provider_id,
measure_id,
readmission_score,
readmission_sample,
readmission_low,
readmission_high,
readmission_start,
readmission_end
FROM readmissions;

DROP TABLE survey_lite;
CREATE TABLE survey_lite AS SELECT
provider_id,
survey_baseline,
survey_consistency
FROM survey;
