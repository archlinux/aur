#!/bin/sh

docker build . -t transmission-rss-pkgbuild
docker run -it -v $(pwd):/src/transmission-rss transmission-rss-pkgbuild $@
