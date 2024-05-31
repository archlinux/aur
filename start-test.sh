#!/bin/bash

docker run -it --rm \
       -u bb -w /home/bb \
       -v ./:/home/bb/aur \
       archlinux-base-dev /home/bb/aur/execute-makepkg.sh
