#!/bin/bash

### This script is for reference purposes. It can be used to build the package. It is NOT called by the PKGBUILD. It just lays around here for reference.

_BUILD_DOC=yes _PLAUT04_WITH_QT=no _WITH_PLAUT04=yes _AUTO_DEBUG=yes _WITH_MPI=no _WITH_OPENMP=no makepkg "$@"
