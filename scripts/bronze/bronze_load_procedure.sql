// Create stored procedure to load data from csv to postgres Bronze Layer

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
	end_time TIMESTAMP;
	time_diff INTERVAL;
	start_time_batch TIMESTAMP;
	end_time_batch TIMESTAMP;
BEGIN

	RAISE NOTICE 'Beginning data load for CRM';
	RAISE NOTICE '=================================';

	start_time_batch := CURRENT_TIMESTAMP;
	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for cust_info at %', start_time;
	TRUNCATE bronze.crm_cust_info;
	COPY bronze.crm_cust_info
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for cust_info at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	RAISE NOTICE '-';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for prd_info.csv at %', start_time;
	TRUNCATE bronze.crm_prd_info;
	COPY bronze.crm_prd_info
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for prd_info.csv at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	RAISE NOTICE '-';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for sales_details.csv at %', start_time;
	TRUNCATE bronze.crm_sales_details;
	COPY bronze.crm_sales_details
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for sales_details.csv at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	RAISE NOTICE '-';
	
	RAISE NOTICE '=================================';
	RAISE NOTICE 'Beginning data load for ERP';
	RAISE NOTICE '=================================';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for CUST_AZ12.csv at %', start_time;
	TRUNCATE bronze.erp_CUST_AZ12;
	COPY bronze.erp_CUST_AZ12
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for CUST_AZ12.csv at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	RAISE NOTICE '-';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for LOC_A101.csv at %', start_time;
	TRUNCATE bronze.erp_LOC_A101;
	COPY bronze.erp_LOC_A101
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for LOC_A101.csv at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	RAISE NOTICE '-';
	
	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Beginning data load for PX_CAT_G1V2.csv at %', start_time;
	TRUNCATE bronze.erp_PX_CAT_G1V2;
	COPY bronze.erp_PX_CAT_G1V2
	FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv' 
	WITH (FORMAT CSV, HEADER true);
	end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Done data load for PX_CAT_G1V2.csv at %', end_time;
	time_diff := end_time - start_time;
	RAISE NOTICE 'Load duration: %', time_diff;
	end_time_batch := CURRENT_TIMESTAMP;
	RAISE NOTICE '-';
	RAISE NOTICE '=================================';
	time_diff = end_time_batch - start_time_batch;
	RAISE NOTICE 'Loading Bronze Layer is Completed';
	RAISE NOTICE 'Load duration of Bronze Layer: %', time_diff;


END;
$$;
