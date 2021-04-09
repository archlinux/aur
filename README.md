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

#### PHP-FPM
1. Configure "php-fpm" so that Matomo has the required permissions for needed files. `sudo mkdir -p /etc/systemd/system/php-fpm.service.d/;sudo nano /etc/systemd/system/php-fpm.service.d/override_matomo.conf` and write this content.
```
[Service]
ReadWritePaths = /usr/share/webapps/matomo/config
ReadWritePaths = /usr/share/webapps/matomo/matomo.js
ReadWritePaths = /usr/share/webapps/matomo/misc/user/
ReadWritePaths = /usr/share/webapps/matomo/plugins/
```

### nginx
1. You can use any HTTP server. Instructions are given for nginx.
2. `sudo nano /etc/nginx/nginx.conf` and configure your nginx server. You also need to create SSL keys.
```
http
{
    # Directives
    ## SSL certificate
    include             /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam         /etc/letsencrypt/ssl-dhparams.pem;
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
1. `sudo systemctl start mariadb.service;sudo systemctl enable mariadb.service`
2. `sudo systemctl start php-fpm.service;sudo systemctl enable php-fpm.service`
