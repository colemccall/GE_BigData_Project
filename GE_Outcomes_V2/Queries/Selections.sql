Use GenEdData

select course_id, count(compliance) as assignments, compliance from dbo.canvas_data
where compliance = 'Outcome attached - no assessment'
group by compliance, course_id


select * from canvas_data