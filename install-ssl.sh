#!/bin/sh

echo "Please do 'rm /etc/ssl/private/zarafa.*' to recreate all ssl files."
#echo "And run /usr/share/doc/"

# Strong SSL Security
# https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html 
# https://cipherli.st/
# http://www.shellhacks.com/en/HowTo-Create-CSR-using-OpenSSL-Without-Prompt-Non-Interactive
if [ ! -f "/etc/ssl/private/zarafa.key" ]
then
    echo "Creating default key (4096 bit) to /etc/ssl/private/zarafa.key"
    openssl genrsa -out /etc/ssl/private/zarafa.key 4096
fi

if [ ! -f "/etc/ssl/private/zarafa.crt" ]
then
    echo "Creating default certificate (sha512 / 3650 days) to /etc/ssl/private/zarafa.crt"    
    openssl req -new -sha512 -key /etc/ssl/private/zarafa.key -out /tmp/zarafa.csr -subj "/CN=localhost"
    openssl x509 -req -days 3650 -in /tmp/zarafa.csr -signkey /etc/ssl/private/zarafa.key -out /etc/ssl/private/zarafa.crt 

    echo "Trust own certificate for later connections"
    find -L /etc/ssl/certs -samefile /etc/ssl/private/zarafa.crt -exec rm {} \;
    ln -s /etc/ssl/private/zarafa.crt /etc/ssl/certs/zarafa.crt 
    ln -s /etc/ssl/private/zarafa.crt /etc/ssl/certs/$(openssl x509 -noout -hash -in /etc/ssl/certs/zarafa.crt).0 
    update-ca-trust
fi

if [ ! -f "/etc/ssl/private/zarafa.dh" ]
then
    echo "Creating Diffie Hellman (2048 bit) precalculation to /etc/ssl/private/zarafa.dh"
    openssl dhparam -out /etc/ssl/private/zarafa.dh 2048
fi

echo "Setting permissions to /etc/ssl/private/zarafa.*"
chmod go-rwx /etc/ssl/private/zarafa.*
chmod u+rw /etc/ssl/private/zarafa.*
chown root:root /etc/ssl/private/zarafa.*

