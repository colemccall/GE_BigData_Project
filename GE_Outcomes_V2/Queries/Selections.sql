USE GenEdData
GO

select * from compliance

select college, compliance, count(compliance) as courses from compliance 
group by compliance, college

select compliance, count(compliance) as section from compliance 
group by compliance

