#!/bin/bash

# autobump pkgver
makepkg -f

# update .SRCINFO
makepkg --printsrcinfo > .SRCINFO
