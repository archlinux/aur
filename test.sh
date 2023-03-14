#!/bin/bash

set -eu

PKG=${1}

REPOSITORY_DIR="$(cd "$(dirname "$0")" && pwd)"

docker build -t arch:direnv-test -f ${REPOSITORY_DIR}/Dockerfile ${REPOSITORY_DIR}

docker run -it --rm \
  -v ${REPOSITORY_DIR}:/work \
  -w /work \
  arch:direnv-test pacman -U ${PKG}

