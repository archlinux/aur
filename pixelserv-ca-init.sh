#!/bin/sh

# generate cert
sudo -u nobody openssl genrsa -out /var/cache/pixelserv/ca.key 1024
sudo -u nobody openssl req -key /var/cache/pixelserv/ca.key -new -x509 -days 3650 -sha256 \
    -extensions v3_ca -out /var/cache/pixelserv/ca.crt -subj "/CN=Pixelserv CA"

# trust cert
sudo cp /var/cache/pixelserv/ca.crt /usr/share/ca-certificates/trust-source/anchors/ca.pixelserv.crt
sudo trust extract-compat
