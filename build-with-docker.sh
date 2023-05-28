#!/bin/sh

set -e

# Run
docker pull archlinux:base-devel
docker run --rm -it \
    -v "$(pwd):/data" \
    -w /data \
    archlinux:base-devel \
    /data/docker-entrypoint.sh
