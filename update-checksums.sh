#!/usr/bin/env bash

docker build -f build-dev.Dockerfile -t archlinux-build-dev --build-arg USERID=$(id -u) --build-arg GROUPID=$(id -g) .

docker run --rm -v $PWD:/build -i archlinux-build-dev <<EOF
makepkg --noconfirm -s -e -o -C -c
updpkgsums
EOF
