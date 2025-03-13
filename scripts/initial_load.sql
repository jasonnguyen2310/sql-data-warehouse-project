// Load data from csv to postgres

TRUNCATE bronze.crm_cust_info;
COPY bronze.crm_cust_info
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' 
WITH (FORMAT CSV, HEADER true);

TRUNCATE bronze.crm_prd_info;
COPY bronze.crm_prd_info
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv' 
WITH (FORMAT CSV, HEADER true);

TRUNCATE bronze.crm_sales_details;
COPY bronze.crm_sales_details
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' 
WITH (FORMAT CSV, HEADER true);

TRUNCATE bronze.erp_CUST_AZ12;
COPY bronze.erp_CUST_AZ12
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv' 
WITH (FORMAT CSV, HEADER true);

TRUNCATE bronze.erp_LOC_A101;
COPY bronze.erp_LOC_A101
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv' 
WITH (FORMAT CSV, HEADER true);

TRUNCATE bronze.erp_PX_CAT_G1V2;
COPY bronze.erp_PX_CAT_G1V2
FROM 'C:\DE Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv' 
WITH (FORMAT CSV, HEADER true);
