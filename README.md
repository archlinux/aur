# Installation

## Necessary configuration

### MariaDB

1. Create a user and a database.

### PHP

1. `sudo nano /etc/php/php.ini` and uncomment the following.

gd:

```
;extension=gd
```

iconv:

```
;extension=iconv
```

MySQL support:

```
;extension=mysqli
;extension=pdo_mysql
```

## Required services

1. mariadb.service
2. php-fpm.service
