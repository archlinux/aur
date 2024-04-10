#!/bin/sh

# Launcher for sm64 Coop DX (US)

pkgname=sm64coopdx
sm64path=~/.local/share/${pkgname}

# Create sm64path if it doesn't exist
mkdir -p "${sm64path}"

# Redirect savepath to sm64path and launch
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/share/sm64coopdx" /usr/share/${pkgname}/${pkgname} --savepath "${sm64path}" "$@"
