#!/bin/sh

currentDir=$(dirname "$0")

makepkg --printsrcinfo -p "${currentDir}/PKGBUILD" >"${currentDir}/.SRCINFO"
