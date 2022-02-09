#!/bin/sh

# Launcher for Super Mario 64 Port (SH)

pkgname=sm64-port-sh
sm64path=~/.local/share/${pkgname}

# Enter sm64path
mkdir -p ${sm64path}
cd ${sm64path}

# Launch Super Mario 64 Port (SH)
/usr/share/${pkgname}/${pkgname}
