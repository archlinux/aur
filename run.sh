#!/bin/sh

ver=0000

docker build -t openmw-validator-aur:${ver} .
docker run --rm openmw-validator-aur:${ver}
