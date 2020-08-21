-- 1. Administer account (Required)

-- CREATE USER '<ADMIN NAME>'@'%' identified by '<ADMIN PASSWORD>';
-- GRANT ALL ON *.* to '<ADMIN NAME>'@'%';

-- 2. Add here to Dedicated Account of wp

-- --TEMPLATE------------------------------------------
-- CREATE DATABASE IF NOT EXISTS <DATABASE NAME>;
-- CREATE USER '<USER NAME>'@'%' identified by '<USER PASSWORD>';
-- GRANT ALL ON <DATABASE NAME>.* to '<USER NAME>'@'%';
-- ----------------------------------------------------