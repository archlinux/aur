#!/bin/sh
# Wrapper for extempore-bin.
#
# Extempore resolves its runtime assets (runtime/, examples/, etc.) relative
# to the current working directory rather than relative to the binary's own
# location, so it must always be launched from inside its install directory.
# This matches upstream's own instructions ("run extempore from inside the
# extempore folder"): https://github.com/digego/extempore
#
# @INSTALLDIR@ is substituted at package build time (see package() in
# PKGBUILD) so this always matches wherever the package actually installs
# the payload, even if pkgname/pkgdir ever change.

cd "@INSTALLDIR@" && exec ./extempore "$@"
