#!/bin/bash

npm install
sed -i $(for arg in $(./get_latest); do
    key=${arg%%=*}
    value=${arg#*=}

    echo "-e s|$key=.*|$key=$value|g"
done) PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO
