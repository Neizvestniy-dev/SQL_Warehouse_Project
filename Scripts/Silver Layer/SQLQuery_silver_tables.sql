---Test and drop---
if OBJECT_ID('silver.combined_permit_data','U') is not null
	drop table silver.combined_permit_data
---Create new tbale in Silver Schema with combined permit data--
create table silver.combined_permit_data (
permit_num nvarchar (50),
permit_type nvarchar (50),
application_date date,
issue_date date,
complete_date date,
permit_status nvarchar (50)
)
---Insert selected columns into new table---
insert into silver.combined_permit_data (
permit_num,
permit_type,
application_date,
issue_date,
complete_date,
permit_status
)
---Match naming to combine two tables---
select [abp_permit_num] as permit_num, [abp_permit_type] as permit_type, [abp_application_date] as application_date, [abp_issue_date] as issue_date, [abp_completed_date] as complete_date, [abp_status] as permit_status
from [bronze].[active_building_permits]
union all
select [cbp_permit_num] as permit_num, [cbp_permit_type] as permit_type, [cbp_application_date] as application_date, [cbp_issue_date] as issue_date, [cbp_completed_date] as complete_date, [cbp_status] aspermit_status
from [bronze].[cleared_building_permits]
