USE BigData

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'canvas_data')  
	DROP TABLE [dbo].[canvas_data]; 


CREATE TABLE BigData.dbo.canvas_data(
student_id nvarchar(50)
, submission_date nvarchar(50)
, assignment_id nvarchar(MAX)
, outcome_code nvarchar(50)
, outcome_year nvarchar(50)
, course_id nvarchar(MAX)
, semester nvarchar(50)
, course nvarchar(50)
, section nvarchar(50)
, outcome_score nvarchar(50)
, outcome_rating nvarchar(50)
, college nvarchar(MAX)
, compliance nvarchar(MAX)
)
;
   


