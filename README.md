# Celeste PKGBUILD for ARM architectures

This repo contains a PKGBUILD file for compiling the support libs ([FNA3D], [FMOD_SDL]) needed to run [Celeste] on ARM (armv7h, aarch64), allowing Celeste to build and run on Linux distros like [Arch Linux ARM] and [Manjaro ARM].

## Requirements

* You need a copy of Celeste.  The PKGBUILD has only been tested with the [v1.4.0.0 release on itch.io](https://mattmakesgames.itch.io/celeste), but may work with other releases.
* You need to download [FMOD][FMOD] in order to get ARM binaries.  This requires [registering an account](https://www.fmod.com/profile/register) with FMOD, going to the downloads page and downloading the right version (see below) of "FMOD Engine" - see below for version info.

### FMOD version

FMOD didn't support aarch64 until version 2, whereas Celeste was built to work with version 1.  At present, the PKGBUILD therefore uses FMOD 2 and applies some further patches to make Celeste work with it.

At present, the version used is 2.02.06.  Other 2.x versions may also work, and on platforms other than aarch64, you can also try FMOD 1.x.

## Building

Place your copies of `celeste-linux.zip` and `fmodstudioapi<version>linux.tar.gz` in the same directory as the PKGBUILD file, and run `makepkg`.  You can speed up the packaging process a bit if you don't compress the package at the end - i.e. `PKGEXT='.pkg.tar' makepkg`.

## Reporting any issues

Probably via AUR?

## Notes

* Tested most recently on Manjaro ARM running on a RockPro64 (RK3399).
* The `fmodstudio_fix.c` file that is used to make FMOD 2.x work is a copy-paste from https://github.com/pixelomer/Celeste-ARM64/issues/2 and credit for it should go to @JohnnyonFlame.
* The [Celeste-ARM64](https://github.com/pixelomer/Celeste-ARM64) repo takes a slightly different approach to patching, which used to work for me, but stopped after an update to glibc.
* armv7h isn't working at the moment - maybe it should be updated to use FMOD 2.x as well...?

[FNA3D]: https://github.com/FNA-XNA/FNA3D
[FMOD_SDL]: https://github.com/flibitijibibo/FMOD_SDL
[Celeste]: http://www.celestegame.com/
[Arch Linux ARM]: https://archlinuxarm.org/
[Manjaro ARM]: https://wiki.manjaro.org/index.php/Manjaro-ARM
[FMOD]: https://www.fmod.com/
