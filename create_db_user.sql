CREATE USER 'tango-db'@'localhost' IDENTIFIED VIA unix_socket;
GRANT ALL PRIVILEGES ON tango.* TO 'tango-db'@'localhost';
FLUSH PRIVILEGES;
