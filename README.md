# Install Instructions


## Build and install PKG manually
To build this package without an AUR helper (recommended) run the following commands from the directory which contains the PKGBUILD.

    makepkg -sic

## Using an AUR helper
You should be able to install this package by running one of the following commands.

For yaourt:

yaourt -Syy freelancer-desktop-app

For pacaur:

pacaur -Syy freelancer-desktop-app

## Issues

Please report any issues to the AUR: https://aur.archlinux.org/packages/freelancer-desktop-app

If you wish to install this package manually run the following from your command line (not as root):

        git clone https://github.com/justintime4tea/aur-freelancer-desktop-app.git && cd aur-freelancer-desktop-app && makepkg -sic