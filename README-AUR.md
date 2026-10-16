# AUR package: beammp-launcher4linux-git

Builds the fork at https://github.com/SerShef/BeamMP-Launcher4Linux
(notably: adds a GamePath option to Launcher.cfg, so a non-Steam or
prefix-wrapped BeamNG.drive install can be found without registering
app id 284160 in Steam's libraryfolders.vdf).

## Prerequisites

- base-devel
- vcpkg (AUR package /opt/vcpkg install, or set VCPKG_ROOT=/path/to/vcpkg)

## Build

`makepkg -si` (or `makepkg -si --skipinteg` when networking from vcpkg is restricted)

## Upload to AUR (maintainer only)

    git remote add aur ssh://aur@aur.archlinux.org/beammp-launcher4linux-git.git
    git add -A
    git commit -m "Initial import of beammp-launcher4linux-git"
    git push aur master

SSH key must be registered on https://aur.archlinux.org/account/<user>.
