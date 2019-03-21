#!/bin/sh

docker build . -t ruby-open_uri_redirections-pkgbuild
docker run -it -v $(pwd):/src ruby-open_uri_redirections-pkgbuild $@
