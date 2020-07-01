CREATE DATABASE IF NOT EXISTS wp01;
CREATE USER 'user-name'@'%' identified by 'sample-password';
GRANT ALL ON wp01.* to 'user-name'@'%';