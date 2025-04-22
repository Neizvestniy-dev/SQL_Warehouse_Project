
use master;

---Create the DataWarehouse---

create database DataWarehouse;

---Open the DataWarehouse--
use DataWarehouse;

---Create the schemas---
go
---Bronze for Raw Data--
create schema bronze;
go
---Silver for Edited Data--
create schema silver;
go 
---Gold for final business ready data---
create schema gold;
