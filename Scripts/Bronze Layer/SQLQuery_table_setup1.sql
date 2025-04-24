---Test and drop---
if OBJECT_ID('bronze.short_term_rental_registration_data','U') is not null
	drop table bronze.short_term_rental_registration_data;
---Create table for Short Term Rental Data---
create table bronze.short_term_rental_registration_data (
shr_id int,
shr_operator_registration_number nvarchar(50),
shr_address nvarchar(50),
shr_unit nvarchar(50),
shr_postal_code nvarchar(50),
shr_property_type nvarchar(50),
shr_ward_number int,
shr_ward_name nvarchar(50)
)
---Test and drop---
if OBJECT_ID('bronze.cleared_building_permits','U') is not null
	drop table bronze.cleared_building_permits;
---Create table for Cleared Building Permits---
create table bronze.cleared_building_permits (
cbp_id int,
cbp_permit_num nvarchar(50),
cbp_revison_num int,
cbp_permit_type nvarchar(50),
cbp_structure_type nvarchar(50),
cbp_work nvarchar(50),
cbp_street_num nvarchar(50),
cbp_street_name nvarchar(50),
cbp_street_type nvarchar(50),
cbp_street_direction nvarchar(50),
cbp_postal nvarchar(50),
cbp_geo_id int,
cbp_ward_grid nvarchar(50),
cbp_application_date date,
cbp_issue_date date,
cbp_completed_date date,
cbp_status nvarchar(50),
cbp_description nvarchar(MAX),
cbp_current_use nvarchar(500),
cbp_proposed_used nvarchar(500),
cbp_dwelling_units_created int,
cbp_dwelling_units_lost int,
cbp_est_const_cost float,
cbp_assembly float,
cbp_institutional float,
cbp_residential float,
cbp_business_personal float,
cbp_mercantile float,
cbp_industrial float,
cbp_interio_alterations float,
cbp_demolition float,
cbp_builder_name nvarchar(100)
)
---Test and drop---
if OBJECT_ID('bronze.active_building_permits','U') is not null 
	drop table bronze.active_building_permits;
---Create table for Active Building Permits---
create table bronze.active_building_permits (
abp_id int,
abp_permit_num nvarchar(50),
abp_revison_num int,
abp_permit_type nvarchar(50),
abp_structure_type nvarchar(50),
abp_work nvarchar(50),
abp_street_num nvarchar(50),
abp_street_name nvarchar(50),
abp_street_type nvarchar(50),
abp_street_direction nvarchar(50),
abp_postal nvarchar(50),
abp_geo_id int,
abp_ward_grid nvarchar(50),
abp_application_date date,
abp_issue_date date,
abp_completed_date date,
abp_status nvarchar(50),
abp_description nvarchar(MAX),
abp_current_use nvarchar(500),
abp_proposed_used nvarchar(500),
abp_dwelling_units_created int,
abp_dwelling_units_lost int,
abp_est_const_cost float,
abp_assembly float,
abp_institutional float,
abp_residential float,
abp_business_personal float,
abp_mercantile float,
abp_industrial float,
abp_interio_alterations float,
abp_demolition float,
abp_builder_name nvarchar(100)
)