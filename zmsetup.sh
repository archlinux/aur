#!/usr/bin/bash

choice="$1"

echo "WARNING: This script is heavilly WIP. Caveat emptor."
echo
echo "Please report any bugs you find at https://aur.archlinux.org/packages/zoneminder/"
echo

if [[ $EUID -ne 0 ]]
then
    echo "ERROR: This script must be run as root."
    exit 1
fi

case "$choice" in
    
    --nginx )
    
    systemctl daemon-reload
        
    # Ensure Nginx, fcgiwrap, spawn-fcgi and multiwatch are installed
    if [[ "$(pacman -Qs nginx)" = *"local/nginx"* ]] && [[ "$(pacman -Qs fcgiwrap)" = *"local/fcgiwrap"* ]] && [[ "$(pacman -Qs spawn-fcgi)" = *"local/spawn-fcgi"* ]] && [[ "$(pacman -Qs multiwatch)" = *"local/multiwatch"* ]]
    then
        # Ensure the main conf file is present
        if [ -f /etc/nginx/nginx.conf ]
        then
            # Configure Nginx with the folder structure used in Debian-based distributions
            if ( ! grep -q 'sites-enabled' /etc/nginx/nginx.conf )
            then
                sed -i 's|http {|http {\'$'\n    include       sites-enabled/*.conf;|g' /etc/nginx/nginx.conf
            fi
            
            # Create the sites-enabled folder if it's not already created
            if [ ! -d /etc/nginx/sites-enabled ]
            then
                mkdir -p /etc/nginx/sites-enabled
            fi
            
            # Enable ZoneMinder's server block if it's not already enabled
            if [ ! -f /etc/nginx/sites-enabled/zoneminder.conf ]
            then
                ln -sf /etc/nginx/sites-{available,enabled}/zoneminder.conf
            fi
            
            # Start Nginx
            systemctl is-active --quiet nginx && systemctl stop nginx
            systemctl restart --quiet nginx && echo "* Nginx successfully configured"
        else
            echo "ERROR: Nginx is installed but /etc/nginx/nginx.conf was not found"
            exit 1
        fi
        
        ### fcgiwrap ###

        # By default fcgiwrap is configured to launch in 10 instances via spawn-fcgi and multiwatch. This should be
        # enough for ZoneMinder to operate with 3 cameras. If you need more than 10 simultaneous CGI threads, edit the
        # provided fcgiwrap-multiwatch.service file and increase the number of instances to whatever suits your needs.

        systemctl is-active --quiet fcgiwrap.socket && systemctl stop fcgiwrap.socket
        systemctl is-active --quiet fcgiwrap && systemctl stop fcgiwrap
        systemctl is-active --quiet fcgiwrap-multiwatch && systemctl stop fcgiwrap-multiwatch
        systemctl restart --quiet fcgiwrap-multiwatch && echo "* fcgiwrap-multiwatch successfully configured"
    else
        echo "ERROR: You must install Nginx, fcgiwrap, spawn-fcgi and multiwatch before using this script with the --nginx flag"
        exit 1
    fi
    ;;
    
    --apache )
    
    systemctl daemon-reload
        
    # Ensure Apache is installed
    if [[ "$(pacman -Qs apache)" = *"local/apache"* ]]
    then
        # Ensure the main conf file is present
        if [ -f /etc/httpd/conf/httpd.conf ]
        then
            # Enable mod_proxy
            sed -i 's|#LoadModule proxy_module modules/mod_proxy.so|LoadModule proxy_module modules/mod_proxy.so|g' /etc/httpd/conf/httpd.conf
            # Enable mod_proxy_fcgi
            sed -i 's|#LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so|LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so|g' /etc/httpd/conf/httpd.conf
            # Enable mod_rewrite
            sed -i 's|#LoadModule rewrite_module modules/mod_rewrite.so|LoadModule rewrite_module modules/mod_rewrite.so|g' /etc/httpd/conf/httpd.conf
            # Enable mod_cgid
            sed -i 's|#LoadModule cgid_module modules/mod_cgid.so|LoadModule cgid_module modules/mod_cgid.so|g' /etc/httpd/conf/httpd.conf
            
            # Enable ZoneMinder's VirtualHost if it's not already enabled
            if ( ! grep -q 'zoneminder.conf' /etc/httpd/conf/httpd.conf )
            then
                echo "Include conf/extra/zoneminder.conf" >> /etc/httpd/conf/httpd.conf
            fi

            # Start Apache
            systemctl is-active --quiet httpd && systemctl stop httpd
            systemctl restart --quiet httpd && echo "* Apache successfully configured"
        else
            echo "ERROR: Apache is installed but /etc/httpd/conf/httpd.conf' was not found"
            exit 1
        fi
    else
        echo "ERROR: You must install Apache before using this script with the --apache flag"
        exit 1
    fi
    ;;
    
    * )
    
    echo "Usage: $0 [--nginx|--apache]"
    exit 1
esac

# Ensure MariaDB is installed
if [[ "$(pacman -Qs mariadb)" = *"local/mariadb "* ]]
then
    # Initialize MariaDB's default database if it's not already initialized
    if [ ! -d /var/lib/mysql/mysql ]
    then
        systemctl is-active --quiet mariadb && systemctl stop mariadb
        mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql 2> /dev/null
    fi
    
    # Start MariaDB
    systemctl restart --quiet mariadb
    
    # Create ZoneMinder's database & user if they do not exist
    if [ ! -d /var/lib/mysql/zm ]
    then
        # Check for database root password
        if [[ "$(mysql -uroot -e "select * from mysql.user;" 2>&1)" = *"Access denied"* ]]
        then
            # If a database root password is set
            echo "* Secure MariaDB installation found, please enter the database root password."
            echo
            mysql -uroot -p < /usr/share/zoneminder/db/zm_create.sql
            echo
            echo "* Enter the password one more time..."
            echo
            mysql -uroot -p -e "grant select,insert,update,delete,create,drop,alter,index,lock tables,alter routine,create routine,trigger,execute on zm.* to 'zmuser'@localhost identified by 'zmpass';"
            echo
        else
            # If a database root password is not set
            mysql -uroot < /usr/share/zoneminder/db/zm_create.sql
            mysql -uroot -e "grant select,insert,update,delete,create,drop,alter,index,lock tables,alter routine,create routine,trigger,execute on zm.* to 'zmuser'@localhost identified by 'zmpass';"
        fi
    fi
    echo "* MariaDB successfully configured"
else
    echo "* Skipping MariaDB"
fi

systemctl restart php-fpm && echo "* php-fpm successfully configured"

echo

systemctl is-active --quiet zoneminder && systemctl stop zoneminder
systemd-tmpfiles --create
systemctl start zoneminder && echo "  All done! ZoneMinder is (hopefully) listening at http://localhost:8095"
