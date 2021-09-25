#!/bin/sh

docker run -v $PWD:/w -v pkg:/var/cache/pacman --rm -it sfesenko/makepkg "$@"
