---Add new column that calculates the years passed between application date and completion datee---

---Test and drop---
if col_length ('silver.combined_permit_data', 'date_difference') is not null
	alter table [silver].[combined_permit_data] drop column [date_difference];
---Create new column---
alter table [silver].[combined_permit_data]
	add date_difference int
---Populate new column---
UPDATE [silver].[combined_permit_data]
set date_difference = datediff(year,application_date, isnull(complete_date, getdate())) 
---Delete empty rows---
delete from [silver].[combined_permit_data]
	where  [permit_num] is null
---View the whole table---
select * from [silver].[combined_permit_data]
---View the averages for each type of permit---
select [permit_type], AVG([date_difference]) as average from [silver].[combined_permit_data]
group by [permit_type]

