use DataWarehouse
--- Check for existance ---
if col_length ('silver.combined_permit_data', 'date_difference') is not null
	alter table [silver].[combined_permit_data] drop column [date_difference]
--- Add new column date_difference ---
alter table [silver].[combined_permit_data]
	add date_difference int
--- Populate ne column date_diiference that calculate time between application_date and issue_date ---
UPDATE [silver].[combined_permit_data]
set date_difference = datediff(DAY,application_date, issue_date) 
---View the whole table---
select * from [silver].[combined_permit_data]
---View the averages for each type of permit in different time brackets---
select permit_type,
AVG(case when year (application_date) <= 2008 then date_difference end) as average_before_2008, 
AVG(case when year (application_date) < 2019 and year(application_date) > 2008 then date_difference end) as average_2008to2019, 
AVG(case when year (application_date) >= 2019 and year(application_date) < 2024 then date_difference end) as average_after_2019to2024,
AVG(case when year (application_date) > 2024 then date_difference end) as average_after_2024
from silver.combined_permit_data
where date_difference is not null 
group by permit_type
--- Check obnormalitites with Site Inspections -- 
select * from silver.combined_permit_data
where permit_type = 'Site Inspection(Scarborough)'
--- Qualitative check---
SELECT COUNT(permit_type) 
FROM silver.combined_permit_data
WHERE permit_type = 'Residential Building Permit'
UNION ALL
SELECT COUNT(abp_permit_type) 
FROM bronze.active_building_permits
WHERE abp_permit_type = 'Residential Building Permit'
UNION ALL
SELECT COUNT(cbp_permit_type)
FROM bronze.cleared_building_permits
WHERE cbp_permit_type = 'Residential Building Permit'
---Inspect Residential Building Permit ---
select * 
from silver.combined_permit_data
where permit_type = 'Residential Building Permit'
order by application_date desc
