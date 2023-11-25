#!/usr/bin/bash

pkgctl build --repo extra --arch x86_64 --clean
makepkg --printsrcinfo > .SRCINFO
