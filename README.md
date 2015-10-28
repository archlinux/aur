# Arch package docker-gc

[docker-gc](https://github.com/spotify/docker-gc) is a simple Docker container and image garbage collection script.


## Install using an AUR helper

[AUR Helpers](https://wiki.archlinux.org/index.php/AUR_helpers) provide a simpler interface to the Arch User Repository. There are serveral tools that allow to build an install an AUR package using a single command.

* `yaourt docker-gc`
* `aura -A docker-gc`
* `pacaur -y docker-gc`

## Build and install the package

[Installing packages from AUR](https://wiki.archlinux.org/index.php/AUR_User_Guidelines#Installing_packages) can be done manually:

* Clone the [docker-gc AUR repository](https://aur.archlinux.org/docker-gc.git)
  `git clone https://aur.archlinux.org/docker-gc.git`
* Change into the cloned repository
  `cd docker-gc`
* Inspect the package
  `vi PKGBUILD`
* Build and install the package
  `makepkg -srci`

## Update the PKGBUILD

* Update PKGBUILD
* Update source file hashes
  `updpkgsums`
* Update the .SRCINFO
  `mksrcinfo`
* Build the package
  `makepkg -src`
* Check package
  `namcap docker-gc-*.pkg.tar.xz`