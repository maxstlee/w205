DROP TABLE hospitalStateandRating;
CREATE TABLE hospitalStateandRating AS
	SELECT hospital_name, state, CAST(hospital_overall_rating AS INT)
	FROM hospitals
	WHERE hospital_overall_rating <> "Not Available";
  

DROP TABLE procedureScores
CREATE TABLE procedureScores AS
	Select  hospital_name, state, measure_id, measure_name, CAST(score AS FLOAT)
	FROM effective_care

DROP TABLE readmissionsScores
CREATE TABLE readmissionsScores AS
	Select  hospital_name, state, measure_id, measure_name, CAST(score AS FLOAT)
	FROM readmissions
  
DROP TABLE measureCompact;
CREATE TABLE measureCompact As
	SELECT measure_name, measure_id
	FROM measures;

DROP TABLE surveyScore;
CREATE TABLE surveyScore As
	SELECT hospital_name, hcahps_base_score
	FROM surveys_responses;
