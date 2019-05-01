# Custom PKBUILD

This PKBUILD and INSTALL file creates a package for Arch Linux distribution compatible with the pacman package manager.

This work is a support for the AUR package made by agentcobra#6142.

To use it, download the files and go in this directory. Then, do a `makepkg` to build the package and finally, do `sudo pacman -U ./shadow-beta-*-x86_64.pkg.tar.xz` to install it.

It is an all-in-one installer as in embbeds a wrapper that check your configuration (the same used in the AppImage) and fix all the bugs on Arch Linux. The only thing left for Arch users is to setup a valid VA-API installation.
