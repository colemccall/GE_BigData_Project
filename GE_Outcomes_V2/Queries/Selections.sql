USE GenEdData
GO

select * from compliance

select college, compliance, count(compliance) as courses from compliance 
group by compliance, college

select compliance, count(compliance) as section from compliance 
group by compliance

--Compliance
select teacher_#1_name, Compliance from compliance  

--semester
select teacher_#1_name, semester from compliance 
 
 --college
select teacher_#1_name, teacher_#1_email, college from compliance 
 
 --course
select teacher_#1_name, course_id, Students, Assignments, outcome_1, outcome_2, course from compliance 