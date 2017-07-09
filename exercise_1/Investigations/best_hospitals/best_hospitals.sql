DROP TABLE hosp_score;
CREATE TABLE hosp_score AS
SELECT hospital_name, hospital_overall_rating
FROM hospitalStateandRating
ORDER BY hospital_overall_rating DESC;

DROP TABLE readScore;
CREATE TABLE readScore AS
SELECT hospital_name, AVG(score) AS readscore
FROM readmissionsscores
GROUP BY hospital_name
ORDER BY readscore DESC;

DROP TABLE procScore;
CREATE TABLE procScore AS
SELECT hospital_name,  AVG(score) AS procscore
FROM procedurescores
GROUP BY hospital_name
ORDER BY procscore DESC;

DROP TABLE joinedhospscore;
CREATE TABLE joinedhospscore AS
SELECT hosp.hospital_name AS name, hosp.hospital_overall_rating AS hosp_rating, rd.readscore, proc.procscore
FROM hosp_score as hosp
INNER JOIN readScore as rd
  ON hosp.hospital_name = rd.hospital_name
INNER JOIN procScore as proc
  ON hosp.hospital_name = proc.hospital_name;


--min max scale, individually called
DROP TABLE scaledhospscore;
CREATE TABLE scaledhospscore AS
SELECT name, (hosp_rating-1)/(5-1) as scaledhosp, (readscore-7.05)/(18.625-7.05) as scaledrd, (procscore-0)/(282.75-0) as scaledproc
FROM joinedhospscore;

DROP TABLE comptable;
CREATE TABLE comptable AS
Select name, scaledhosp, scaledrd, scaledproc, (scaledhosp+scaledrd+scaledproc) as compositescore
FROM scaledhospscore
ORDER BY compositescore DESC;

Select * from comptable LIMIT 10;
