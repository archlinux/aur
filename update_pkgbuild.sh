#!/bin/bash

[ -d ./node_modules ] || npm install

eval $(grep -E '^arch=' PKGBUILD)
archs="${arch[@]}"
eval $(node get_latest $archs)

sed -i.old \
    -e "s|_version=.*|_version=${version}|" \
    -e "s|_update_date=.*|_update_date=${updateDate}|" \
    $(for arch in $archs; do
        echo -n " -e s|_image_url_${arch}=.*|_image_url_${arch}=$(eval "echo -n \$url_${arch}")|"
    done) \
    PKGBUILD
