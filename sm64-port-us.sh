#!/bin/sh

# Launcher for Super Mario 64 Port (US)

pkgname=sm64-port-us
sm64path=~/.local/share/${pkgname}

# Enter sm64path
mkdir -p ${sm64path}
cd ${sm64path}

# Launch Super Mario 64 Port (US)
/usr/share/${pkgname}/${pkgname}
