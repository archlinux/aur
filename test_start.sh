#!/bin/bash
set -e
set -x

sudo docker run -ti --rm -v "$(pwd)":/netatop-dkms archlinux
