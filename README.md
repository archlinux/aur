# lsd
## A Cheap Psychedelic Simulator on Linux


### How To
1. Simply clone the repository, and run the shell script (on Bash (currently))
2. If you want to run this from anywhere, make a binary of this script (using `shc`), add the path to your PATH variable, et voila!

### Arch User Repository
lsd is also available on the AUR, [here](https://aur.archlinux.org/packages/lsd/). You can (also) get the PKGBUILD from there, and install it using your favorite AUR helper.

### Parameters

1. -r | --rows : It specifies how many rows of *trips* you want to print. Pick a suitable number for yourself, depending upon your screen size and resolution.

2. -w | --width : It specifies the width of the *trips*.  Pick a suitable number for yourself, depending upon your screen size and resolution.

3. -o | --widthOffset : It specifies the offset of the *trips* (from where the trips start from).  Pick a suitable number for yourself, depending upon your screen size and resolution. Default is 0 units.

4. -c | --cringe : Produces a more psychedelic effect.

### How to build from PKGBUILD
If you have `makepkg` installed (it is a part of the `base-devel` group for Arch), then you can simply move into this directory, and run

`makepkg -c`

-c : Cleans the redundant binary and source files used to create the package.
