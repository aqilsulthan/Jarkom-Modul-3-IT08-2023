CREATE USER 'kelompokit08'@'%' IDENTIFIED BY 'passwordit08';
CREATE USER 'kelompokit08'@'localhost' IDENTIFIED BY 'passwordit08';
CREATE DATABASE dbkelompokit08;
GRANT ALL PRIVILEGES ON *.* TO 'kelompokit08'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompokit08'@'localhost';
FLUSH PRIVILEGES;