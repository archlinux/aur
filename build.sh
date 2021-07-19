#!/bin/sh

# Note: build still fails sometimes

set +e

./build

qmake-qt4
make

# Second run of qmake, needed for lib directory to be installed correctly
#qmake-qt4

set -e
exit 0

