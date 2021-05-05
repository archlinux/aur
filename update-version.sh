#!/bin/bash

updpkgsums ./PKGBUILD
makepkg --printsrcinfo >| .SRCINFO

# To check and install locally
# makepkg -fsi
