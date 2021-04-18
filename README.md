# Installation
## Necessary configuration
### MariaDB
1. Create a user and database.

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
1. You can use any HTTP server. Instructions are given for nginx.
2. `sudo nano /etc/nginx/nginx.conf` and configure your nginx server. You also need to create SSL keys.
```
http
{
    # Directives
    ## SSL certificate
    ssl_certificate_key /etc/letsencrypt/live/subdomain.domain.me/privkey.pem;
    ssl_certificate     /etc/letsencrypt/live/subdomain.domain.me/fullchain.pem;

    server
    {
        listen          443 ssl;
        listen          [::]:443 ssl;
        server_name     subdomain.domain.me;
        root            /path/to/website/;
        index           index.php;

        location ~ \.php$
        {
            try_files       $uri =404;
            
            # FastCGI
            include         fastcgi.conf;
            fastcgi_pass    unix:/run/php-fpm/php-fpm.sock;
            fastcgi_index   index.php;
        }
    }
}
```

## Required services
1. mariadb.service
2. php-fpm.service
