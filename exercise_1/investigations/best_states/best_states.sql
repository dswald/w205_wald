DROP TABLE best_states;
CREATE TABLE best_states AS
SELECT hospital_state as state, score
FROM best_hospitals best
LEFT JOIN hospitals_lite h
WHERE best.score IS NOT NULL
ON best.provider_id = h.provider_id;

SELECT state, AVG(score) AS score_mean
FROM best_states
WHERE score IS NOT NULL
GROUP BY state
ORDER BY score_mean DESC
LIMIT 10;
