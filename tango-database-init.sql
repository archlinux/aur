CREATE OR REPLACE USER 'tango'@'localhost' IDENTIFIED BY 'tango';
GRANT ALL PRIVILEGES ON tango.* TO 'tango'@'localhost';
FLUSH PRIVILEGES;
