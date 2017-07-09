DROP TABLE procvar;
CREATE TABLE procvar AS
SELECT measure_id, VARIANCE(Score) AS var
FROM procedurescores
GROUP BY measure_id
ORDER BY var DESC
LIMIT 10;

DROP TABLE finalvar;
CREATE TABLE finalVAR AS
SELECT pv.measure_id, measure.measure_name, pv.var
FROM procvar AS pv
INNER JOIN measurecompact AS measure
  ON pv.measure_id = measure.measure_id;
  
SELECT * from finalvar;
