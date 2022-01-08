#!/bin/sh

ver=0000

podman build -t openmw-validator-aur:${ver} .
podman run --rm openmw-validator-aur:${ver}
