#!/bin/sh

ver=0000

docker build -t momw-configurator-aur:${ver} .
docker run --rm momw-configurator-aur:${ver}

makepkg --printsrcinfo > .SRCINFO
