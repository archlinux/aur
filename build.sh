#!/usr/bin/env bash

set -e

docker run --rm -v $(pwd):/tmp/output -v $(pwd)/dockerscript.sh:/root/dockerscript.sh archlinux:base-devel /bin/bash /root/dockerscript.sh
