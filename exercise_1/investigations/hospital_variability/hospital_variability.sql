SELECT provider_id, MAX(score) - MIN(score) AS score_variation FROM best_hospitals
WHERE score IS NOT NULL
GROUP BY provider_id
ORDER BY score_variation DESC
LIMIT 10;
