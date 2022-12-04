USE GenEdData
GO

select * from compliance
order by compliance

--University Complaince by College
select college, compliance, count(compliance) as courses from compliance 
group by compliance, college




--University Compliance by Sections
select compliance, count(compliance) as sections from compliance 
group by compliance




--Unversity Compliance by Professor
select teacher_#1_name, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null
group by Compliance, teacher_#1_name

--Unversity Compliance by Professor (Fall 2022)
select teacher_#1_name, teacher_#1_email, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null and semester = 'FA2022'
group by Compliance, teacher_#1_name, teacher_#1_email

--University Compliance by Professor (Spring 2022)
select teacher_#1_name, teacher_#1_email, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null and semester = 'SP2022'
group by Compliance, teacher_#1_name, teacher_#1_email



--College Stats
--Unversity Compliance by Professor within College of Arts and Humanities
select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Arts and Humanities'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Behavior and Social Sciences'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Education'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Natural and Applied Sciences'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Theology and Christian Ministry'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

select teacher_#1_name,teacher_#1_email, Compliance, count(compliance) as courses, college from compliance  
where teacher_#1_name is not null and college = 'College of Nursing'
group by teacher_#1_email, Compliance, teacher_#1_name, college
order by teacher_#1_name

