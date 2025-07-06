#!/bin/sh

ver=0000

docker build -t wem-aur:${ver} .
docker run --rm wem-aur:${ver}

makepkg --printsrcinfo > .SRCINFO
