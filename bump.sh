#!/bin/sh

pkgctl version upgrade
makepkg --printsrcinfo > .SRCINFO
