#!/bin/env bash

# target directory
TARGET_DIR='/var/cache/pixelserv'

# ensure the target directory exists
if [[ ! -d "$TARGET_DIR" ]]; then
	sudo mkdir -pv "$TARGET_DIR"
fi

# check the ownership of the directory
if [[ "$(stat -c '%U' "$TARGET_DIR")" != 'nobody' ]]; then
	sudo chown -v nobody:nobody "$TARGET_DIR"
fi

# generate cert
sudo -u nobody openssl genrsa -out "$TARGET_DIR"/ca.key 2048
sudo -u nobody openssl req -key "$TARGET_DIR"/ca.key -new -x509 -days 3650 -sha256 \
	-extensions v3_ca -config /etc/ssl/openssl.cnf \
	-out "$TARGET_DIR"/ca.crt -subj "/CN=Pixelserv CA"

# trust cert
sudo cp "$TARGET_DIR"/ca.crt /usr/share/ca-certificates/trust-source/anchors/ca.pixelserv.crt
sudo trust extract-compat
