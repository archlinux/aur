#!/bin/sh

# Launcher for Super Mario 64 Port (JP)

pkgname=sm64-port-jp
sm64path=~/.local/share/${pkgname}

# Enter sm64path
mkdir -p ${sm64path}
cd ${sm64path}

# Launch Super Mario 64 Port (JP)
/usr/share/${pkgname}/${pkgname}
