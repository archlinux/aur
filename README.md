# hla-aur-package-bin

AUR install helper for the High-Level Assembler for the 80x86 CPU

## build

`makepkg`

to re-build, `makepkg -f`

## build and install

`makepkg -si`

to re-install, `makepkg -fsi`

## generate the .SRCINFO file

`makepkg --printsrcinfo > .SRCINFO`

## view the .install file

`source ./hla-bin.install && post_install`

