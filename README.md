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

### Nginx
1. You can use any HTTP server. Instructions are given for Nginx.
2. `sudo nano /etc/nginx/nginx.conf` and configure your Nginx server. You also need to create SSL keys. Take a look at [these](https://github.com/matomo-org/matomo-nginx) instructions.

## Required services
1. mariadb.service
2. php-fpm.service
