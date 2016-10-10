DROP TABLE best_hospitals;

CREATE TABLE best_hospitals AS
SELECT provider_id, measure_id, (32-readmission_score)/(-32) AS score FROM readmissions_lite
UNION ALL
SELECT provider_id, measure_id, care_score AS score FROM effective_lite;

SELECT provider_id, measure_id, AVG(score) AS score_mean FROM best_hospitals GROUP BY provider_id, measure_id
ORDER BY score_mean DESC
LIMIT 10;
