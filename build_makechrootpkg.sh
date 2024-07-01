#!/usr/bin/bash

sudo rm -rvf ArchChroot
mkdir ArchChroot
mkarchroot ArchChroot/root base-devel # devtools
makechrootpkg -c -r ArchChroot # devtools
makepkg --printsrcinfo > .SRCINFO # pacman
