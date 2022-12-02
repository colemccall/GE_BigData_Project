USE GenEdData

select * from compliance

select college, compliance, count(compliance) as courses from compliance 
group by compliance, college