#!/usr/bin/env bash

# This script builds the package with Docker. This way, you don't have to
# install the `makedepends` nor the `checkdepends`. Run from current directory.

docker run --rm \
  --env BUILD_USER_GID=$(id -u) \
  --env BUILD_USER_UID=$(id -u) \
  --volume $(pwd):/mnt/project \
  implementing/builder makepkg

# The pkgver will be updated; so we restore it.
git checkout PKGBUILD
