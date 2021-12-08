#!/bin/sh

LD_PRELOAD=/usr/lib/libsqlcipher.so exec "/opt/Element-Nightly/element-desktop-nightly" "$@"
