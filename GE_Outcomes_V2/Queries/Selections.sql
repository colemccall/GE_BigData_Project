USE GenEdData
GO

select * from compliance
order by compliance

--University Complaince by College
select college, compliance, count(compliance) as courses from compliance 
group by compliance, college




--University Compliance by Sections
select compliance, count(compliance) as section from compliance 
group by compliance




--Unversity Compliance by Professor
select teacher_#1_name, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null
group by Compliance, teacher_#1_name

--Unversity Compliance by Professor (Fall 2022)
select teacher_#1_name, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null and semester = 'FA2022'
group by Compliance, teacher_#1_name

--University Compliance by Professor (Spring 2022)
select teacher_#1_name, Compliance, count(compliance) as courses from compliance  
where teacher_#1_name is not null and semester = 'SP2022'
group by Compliance, teacher_#1_name

