DROP TABLE state_score;
CREATE TABLE state_score AS
SELECT state, AVG(hospital_overall_rating) AS avg_rating
FROM hospitalStateandRating
GROUP BY state
ORDER BY avg_rating DESC;

SELECT * FROM state_score Limit 10;
