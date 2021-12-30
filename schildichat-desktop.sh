#!/bin/sh

LD_PRELOAD=/usr/lib/libsqlcipher.so exec "/opt/SchildiChat/schildichat-desktop" "$@"
