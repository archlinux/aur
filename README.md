# Installation
## Necessary configuration
### MariaDB
1. Create a user and a database.

### PHP
1. `sudo nano /etc/php/php.ini` and comment out the following.
MySQL support:
```
;extension=mysqli
;extension=pdo_mysql
```

iconv:
```
;extension=iconv
```

gd:
```
;extension=gd
```

## Required services
1. mariadb.service
2. php-fpm.service
