# makepkg-optimize

makepkg-optimizeAUR is a collection of supplemental tidy, buildenv, and executable scripts for pacman which provide macros for several kinds of optimization in the build() and package() stages.

## Installation

Install makepkg-optimize-mold(https://aur.archlinux.org/packages/makepkg-optimize-mold/) and, to make optimizations available, install their backends: openmp, upx, optipng, svgo and mold

## Configuration

makepkg-optimize generates a redundant configuration file, /etc/makepkg-optimize.conf, from your current makepkg.conf configuration.

This file lists supplementary COMPILE FLAGS, BUILD ENVIRONMENT options, GLOBAL PACKAGE OPTIONS, PACKAGE OUTPUT options, and COMPRESSION DEFAULTS, all of which are disabled by default.

Some packages may fail to build with certain optimizations and over-optimization may cause problems for some programs--such as decreased performance and segmentation faults.

## Build an optimized package

After selecting your preferred optimizations, pass the configuration file when building:

- makepkg -c --config /etc/makepkg-optimize.conf

### Profile-guided optimization

Note: Profile-guided optimization requires that a package be built and installed twice. The first phase initiates profile generation in $PROFDEST/pkgbase.gen; the second moves them to $PROFDEST/pkgbase.used and applies them

## Build an optimized package in a clean chroot

Alternatively, makepkg-optimize can be used to build optimized packages within a chroot.

## Create a PGO cache ====

To use PGO, create a folder in the same place, inside and outside of the chroot, to store [https://gcc.gnu.org/onlinedocs/gcc/Gcov-Data-Files.html profiles]:

- mkdir -m 777 {"$CHROOT"/{root,"$USER"},}/mnt/pgo

Then edit CHROOT/root/etc/makepkg-optimize.conf and set PROFDEST=/mnt/pgo.

## Building with PGO

After the first building phase, bind the PGO cache:

- mount -o bind {,"CHROOT"/root}/mnt/pgo

- mount -o bind "$CHROOT"/{root,"$USER"}/mnt/pgo

Tip: Use fstab to bind these folders at boot.

## Using buildcache

You can use buildcache if you replace in /usr/share/makepkg/buildenv/compiler.sh with the compiler.sh.in in the repo.
Then you need to exec the buildcache.sh for setting the symlinks.

## Using custom llvm toolchain

Just place your toolchain into ~/Documents/llvm , that it looks then like this:
```
ls ~/Documents/llvm
drwxr-xr-x - ptr1337 23 Jun 13:25  bin
drwxr-xr-x - ptr1337 23 Jun 13:25  include
drwxr-xr-x - ptr1337 23 Jun 13:25  lib
drwxr-xr-x - ptr1337 23 Jun 13:25  share
```
After that enable as buildoption options=(bolt) and it will use the toolchain

## Building packages with relocations for the ability to bolt them

If compiling with clang, simply add as buildoption 'relocs' and it will add 'LDFLAGS+="--emit-relocs"'
If compiling with gcc your target package, add as options 'relocsgcc' these will add -fno-reorder-functions since gcc enables these as default which results into a not bolt able binary

## Using a different linker (lld/mold)

Simply add as option 'lld' or 'mold' and it will add the regarding -fuse-ld='linker'. OM

