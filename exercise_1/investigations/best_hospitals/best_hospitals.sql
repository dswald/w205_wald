


CREATE TABLE best_hospitals AS
SELECT provider_id, measure_id, (36-readmission_score)/(-36) AS score FROM readmissions_lite
UNION ALL
SELECT provider_id, measure_id, (care_score/1180) AS score FROM effective_lite;

SELECT provider_id, measure_id, AVG(score) AS score_mean
FROM best_hospitals
GROUP BY provider_id, measure_id
WHERE score IS NOT NULL
ORDER BY score_mean DESC
LIMIT 10;


SELECT provider_id, AVG(score) AS score_mean FROM best_hospitals
WHERE score IS NOT NULL
GROUP BY provider_id
ORDER BY score_mean DESC
LIMIT 10;
