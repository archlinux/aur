#!/usr/bin/env bash
image_id=$(docker build -q --pull -f build.Dockerfile .)
docker run --rm -it $image_id
