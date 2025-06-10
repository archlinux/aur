#!/bin/sh
docker run -it --rm \
  -p 65535:65535/tcp \
  -v ~/.cache:/cache \
  -v ~/Music:/data \
  ghcr.io/streambinder/spotitube --help
