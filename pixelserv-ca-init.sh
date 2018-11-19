#!/bin/sh

# generate cert
openssl genrsa -out /var/cache/pixelserv/ca.key 1024
openssl req -key /var/cache/pixelserv/ca.key -new -x509 -days 3650 -sha256 \
    -extensions v3_ca -out /var/cache/pixelserv/ca.crt -subj "/CN=Pixelserv CA"

# trust cert
cp /var/cache/pixelserv/ca.crt /usr/share/ca-certificates/trust-source/anchors/ca.pixelserv.crt
trust extract-compat
