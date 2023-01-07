#!/bin/sh

ver=0000

podman build -t wem-aur:${ver} .
podman run --rm wem-aur:${ver}

makepkg --printsrcinfo > .SRCINFO
