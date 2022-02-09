#!/bin/sh

# Launcher for Super Mario 64 Port (EU)

pkgname=sm64-port-eu
sm64path=~/.local/share/${pkgname}

# Enter sm64path
mkdir -p ${sm64path}
cd ${sm64path}

# Launch Super Mario 64 Port (EU)
/usr/share/${pkgname}/${pkgname}
