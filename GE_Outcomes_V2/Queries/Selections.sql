USE GenEdData
GO

select * from compliance
order by compliance

--University Complaince by College
select college, compliance, reason, semester, count(compliance) as courses from compliance 
group by semester, compliance, college, reason
order by college




--University Compliance by Sections
select reason, compliance, count(compliance) as sections from compliance 
group by compliance, reason




--Unversity Compliance by Professor
select teacher_#1_name, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null
group by Compliance, teacher_#1_name




--College Stats
--Unversity Compliance by Professor within College of Arts and Humanities (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Arts and Humanities'
group by compliance, college

--Unversity Compliance by Professor within College of Arts and Humanities (Details)
select teacher_#1_name,teacher_#1_email, Compliance, reason, count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Arts and Humanities'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name




--Unversity Compliance by Professor within College of Behavior and Social Sciences (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Behavior and Social Sciences'
group by compliance, college

--Unversity Compliance by Professor within College of Behavior and Social Sciences (Details)
select teacher_#1_name,teacher_#1_email, Compliance, reason, count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Behavior and Social Sciences'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name





--Unversity Compliance by Professor within College of Education (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Education'
group by compliance, college

--Unversity Compliance by Professor within College of Education (Details)
select teacher_#1_name,teacher_#1_email, Compliance, reason, count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Education'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name




--Unversity Compliance by Professor within College of Natural and Applied Sciences (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Natural and Applied Sciences'
group by compliance, college

--Unversity Compliance by Professor within College of Natural and Applied Sciences (Details)
select teacher_#1_name,teacher_#1_email, Compliance,reason, count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Natural and Applied Sciences'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name





--Unversity Compliance by Professor within College of Theology and Christian Ministry (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Theology and Christian Ministry'
group by compliance, college

--Unversity Compliance by Professor within College of Theology and Christian Ministry (Details)
select teacher_#1_name,teacher_#1_email, Compliance, reason, count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Theology and Christian Ministry'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name




--Unversity Compliance by Professor within College of Nursing (Summary)
select college, compliance, count(compliance) as courses from compliance 
where college = 'College of Nursing'
group by compliance, college

--Unversity Compliance by Professor within College of Nursing (Details)
select teacher_#1_name,teacher_#1_email, Compliance,reason,  count(compliance) as courses, college, semester from compliance  
where teacher_#1_name is not null and college = 'College of Nursing'
group by teacher_#1_email, Compliance, reason, teacher_#1_name, college, semester
order by semester, teacher_#1_name
