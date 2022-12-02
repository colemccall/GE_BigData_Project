USE GenEdData

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'canvas_data')  
	DROP TABLE dbo.registrar_data; 


CREATE TABLE dbo.registrar_data(
	course_sis_id nvarchar(MAX)
	, course_name nvarchar(MAX)
	, number_of_students int
	, outcome_1 nvarchar(50)
	, outcome_2 nvarchar(50)
	, teacher_#1_ID nvarchar(MAX)
	, teacher_#1_name nvarchar(MAX)
	, teacher_#1_email nvarchar(MAX)
	, teacher_#2_ID nvarchar(MAX)
	, teacher_#2_name nvarchar(MAX)
	, teacher_#2_email nvarchar(MAX)
	, teacher_#3_ID nvarchar(MAX)
	, teacher_#3_name nvarchar(MAX)
	, teacher_#3_email nvarchar(MAX)
	, teacher_#4_ID nvarchar(MAX)
	, teacher_#4_name nvarchar(MAX)
	, teacher_#4_email nvarchar(MAX)
	, teacher_#5_ID nvarchar(MAX)
	, teacher_#5_name nvarchar(MAX)
	, teacher_#5_email nvarchar(MAX)
	, teacher_#6_ID nvarchar(MAX)
	, teacher_#6_name nvarchar(MAX)
	, teacher_#6_email nvarchar(MAX)
	, teacher_#7_ID nvarchar(MAX)
	, teacher_#7_name nvarchar(MAX)
	, teacher_#7_email nvarchar(MAX)
	, semester nvarchar(MAX)
	, course nvarchar(MAX)
	, section nvarchar(MAX)
	, college nvarchar(MAX)
)
   