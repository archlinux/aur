#!/usr/bin/bash

sudo rm -rvf ArchChroot
mkdir ArchChroot
mkarchroot ArchChroot/root base-devel
makechrootpkg -c -r ArchChroot
makepkg --printsrcinfo > .SRCINFO
