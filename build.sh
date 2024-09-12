#!/usr/bin/env bash

docker run --rm --volume "${PWD}:/build" archlinux "/build/docker.sh"
