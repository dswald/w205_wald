SELECT CORR(sl.survey_baseline, best.score)
FROM survey_lite sl, best_hospitals best
WHERE best.score IS NOT NULL AND sl.provider_id = best.provider_id;
