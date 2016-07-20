# ArangoDB on Arch Linux

This is a package for building ArangoDB on Arch Linux.
It is [available](https://aur.archlinux.org/packages/arangodb/) via the Arch User Repositories (AUR) and can be
installed with
```sh
yaourt -S arangodb
```

If you have `makepkg` installed you can clone this repo and build it with:

```sh
git clone https://github.com/sleepycat/arangodb_arch.git
cd arangodb_arch
makepkg
# or assuming you have a gpg key:
makepkg --sign
```

This should compile ArangoDB using all available processor cores and
produce a working package. You can install the package with:

```sh
# install the arangodb package from the current folder:
sudo pacman -U arangodb-3.0.0-1-x86_64.pkg.tar.xz
```

This package has fast build times, uses the new cmake build system and
drops unnecessary dependencies like ICU.

Things to explore in the future:
* Incorporate relevant systemd security options
* Include a selinux/apparmour profile by default
* Signing the package
* Encouraging Arango to sign their releases
