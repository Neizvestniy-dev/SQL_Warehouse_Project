---Create Load Procedures---

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
			PRINT '========================================';
			PRINT 'Load Bronze Layer';
			PRINT '========================================';
		-------------------------------------------------
			PRINT '>>Load Short Term Rental Data';
			PRINT '>>Inserting Data into bronze.short_term_rental_registration_data';
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.short_term_rental_registration_data;
		BULK INSERT bronze.short_term_rental_registration_data
		FROM 'C:\Users\olegk\Desktop\Data\short_term_rental_registrations_data.csv'
		WITH (
			firstrow = 2,
			FIELDTERMINATOR = ',',
			tablock
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '----------------------------------------';
		-------------------------------------------------
	
			PRINT '>>Load Cleared Building Permit';
			PRINT '>>Inserting Data into bronze.cleared_building_permit';		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.cleared_building_permits;
		BULK INSERT bronze.cleared_building_permits
		FROM 'C:\Users\olegk\Desktop\Data\cleared_building_permits.csv'
		WITH (
			firstrow = 2,
			FIELDTERMINATOR = ',',
			keepnulls
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '----------------------------------------';
		-------------------------------------------------

			PRINT '>>Load Active Building Permit';
			PRINT '>>Inserting Data into bronze.active_building_permit';
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.active_building_permits;
		BULK INSERT bronze.active_building_permits
		FROM 'C:\Users\olegk\Desktop\Data\active_building_permits.csv'
		WITH (
			firstrow = 2,
			FIELDTERMINATOR = ',',
			keepnulls
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '----------------------------------------';
		-------------------------------------------------

		SET @batch_end_time = GETDATE();
		PRINT '========================================';
		PRINT 'Load Bronze Layer Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' Seconds';
		PRINT '========================================';
	END TRY
	BEGIN CATCH 
		PRINT '========================================';
		PRINT 'Error Occured';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Number' + CAST ( ERROR_NUMBER() AS NVARCHAR);
		PRINT '========================================';
	END CATCH 
END
