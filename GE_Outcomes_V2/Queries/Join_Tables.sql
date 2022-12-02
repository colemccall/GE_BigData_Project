USE GenEdData

IF OBJECT_ID('tempdb.dbo.#Canvas_Stats') IS NOT NULL
    DROP TABLE #Canvas_Stats

IF OBJECT_ID('tempdb.dbo.#Student_Count') IS NOT NULL
    DROP TABLE #Student_Count

SELECT course_id, count(compliance) as assignments, compliance INTO #Canvas_Stats from canvas_data
group by compliance, course_id

SELECT course_id, count(compliance) as num_of_assignments INTO #Student_Count from canvas_data
group by course_id

--SELECT * FROM #Canvas_Stats




-- Queries a report that finds all the sections that had more assignments than students
SELECT C.course_id, C.num_of_assignments, D.number_of_students, D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments > D.number_of_students




-- Queries a report that finds all the sections that did not have an assignment for every student
SELECT C.course_id, C.num_of_assignments, D.number_of_students, D.outcome_1, D.outcome_2, D.teacher_#1_name, D.teacher_#1_email FROM #Student_Count as C
INNER JOIN registrar_data AS D on C.course_id=D.course_sis_id
WHERE C.num_of_assignments < D.number_of_students

