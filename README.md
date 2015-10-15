# Arch package docker-squash

[docker-squash](https://github.com/jwilder/docker-squash) is a utility to squash multiple docker layers into one in order to create an image with fewer and smaller layers.


## Install using an AUR helper

[AUR Helpers](https://wiki.archlinux.org/index.php/AUR_helpers) provide a simpler interface to the Arch User Repository. There are serveral tools that allow to build an install an AUR package using a single command.

* `yaourt docker-squash`
* `aura -A docker-squash`
* `pacaur -y docker-squash`

## Build and install the package

[Installing packages from AUR](https://wiki.archlinux.org/index.php/AUR_User_Guidelines#Installing_packages) can be done manually:

* Clone the [docker-squash AUR repository](https://aur.archlinux.org/foo.git)
  `git clone https://aur.archlinux.org/docker-squash.git`
* Change into the cloned repository
  `cd docker-squash`
* Inspect the package
  `vi PKGBUILD`
* Build and install the package
  `makepkg -srci`
