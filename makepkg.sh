#!/bin/sh

docker run \
  -v $PWD:/w \
  -v pkg:/var/cache/pacman \
  --rm \
  -it \
  \
  --network host \
  -e PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin \
  \
  sfesenko/makepkg "$@"
