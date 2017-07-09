DROP TABLE corrtable;
CREATE TABLE corrtable AS
SELECT hp.hospital_name, hp.hospital_overall_rating as rating, CAST(ss.hcahps_base_score AS FLOAT) as base
FROM hospitalstateandrating AS hp
INNER JOIN surveys_responses AS ss
 ON hp.hospital_name = ss.hospital_name;

SELECT CORR(rating, base) FROM corrtable;
