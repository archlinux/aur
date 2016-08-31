#!/bin/bash

set -e

### Needs to be run from a directory where all the files are in.
### Needs to have write access there.
### Therefore, we use a temporary directory.
workdir="$(mktemp -d)"

cp -a /opt/audible-activator/* "${workdir}/"
cd "${workdir}"

./audible-activator.py "$@"

rm -f "${workdir}"/*
rmdir "${workdir}"
