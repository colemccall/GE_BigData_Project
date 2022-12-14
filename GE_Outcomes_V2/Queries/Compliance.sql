USE GenEdData

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'compliance')  
	DROP TABLE dbo.compliance

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'compliance_college')  
	DROP TABLE dbo.compliance_college

IF OBJECT_ID('tempdb.dbo.#Canvas_Stats') IS NOT NULL
    DROP TABLE #Canvas_Stats

IF OBJECT_ID('tempdb.dbo.#Student_Count') IS NOT NULL
    DROP TABLE #Student_Count



-- This query can be used as verification, calculating some simple compliance stats on the canvas data
SELECT course_id, count(compliance) as assignments, compliance INTO #Canvas_Stats from canvas_data
group by compliance, course_id



-- This query is used to build the compliancy tables (I probably wouldn't mess with it)
SELECT course_id, count(compliance) as num_of_assignments, MAX(semester) as semester
, MAX(course) as course, MAX(section) as section, MAX(college) as college INTO #Student_Count from canvas_data
group by course_id


-- Big query to build the compliancy table
SELECT C.course_id, C.num_of_assignments as 'Assignments', D.number_of_students as 'Students' , D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, C.semester,C.course, C.section, C.college, 'Naughty' as Compliance, 'Too Many Assignment' as Reason INTO dbo.compliance
FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments > D.number_of_students

UNION

SELECT C.course_id, C.num_of_assignments as 'Assignments', D.number_of_students as 'Students' , D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, C.semester,C.course, C.section, C.college, 'Naughty' as Compliance, 'Not Enough Assessments' as Reason 
FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments < (0.7) * D.number_of_students

UNION

SELECT C.course_id, C.num_of_assignments as 'Assignments', D.number_of_students as 'Students',D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, C.semester,C.course, C.section, C.college, 'Unsure' as Compliance, 'Error with registrar data' as Reason
FROM #Student_Count as C
LEFT OUTER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE outcome_1 is null

UNION

SELECT C.course_id, C.num_of_assignments as 'Assignments', D.number_of_students as 'Students' ,D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, C.semester,C.course, C.section, C.college, 'Nice' as Compliance, 'Compliant' as Reason
FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments >= (0.7) * D.number_of_students
AND C.num_of_assignments <= D.number_of_students

UNION

SELECT C.course_id, C.num_of_assignments as 'Assignments', D.number_of_students as 'Students' ,D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, C.semester,C.course, C.section, C.college, 'Nice' as Compliance, 'Compliant' as Reason
FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments >= (0.7) * D.number_of_students
AND C.num_of_assignments <= D.number_of_students

UNION

SELECT D.course_sis_id, '0' as 'Assignments', D.number_of_students as 'Students' , D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email, D.semester,D.course,D.section, D.college, 'Naughty' as Compliance, 'Nothing Attached in Canvas' as Reason
FROM #Student_Count as C
RIGHT OUTER JOIN registrar_data AS D on C.course_id=D.course_sis_id
where C.num_of_assignments is NULL



select * from compliance

select ID = IDENTITY(INT, 1, 1), college, compliance, reason, semester, count(compliance) as courses into compliance_college
from compliance
group by semester, compliance, college, reason
order by college

select * from compliance_college