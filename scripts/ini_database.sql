-- Drop and recreate the 'DataWarehouse' database
DROP DATABASE IF EXISTS datawarehouse;
CREATE DATABASE datawarehouse;

-- Create schema --
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
