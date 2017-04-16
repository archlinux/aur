# Universal IFR Extractor for Linux

A command line port of metacollins' Universal IFR Extractor for macOS, ported to work on Linux.

Utility that can extract the internal forms representation (IFR) from both EFI and UEFI modules and convert it into a human-readable format.

© Original work by 2014 donovan6000

macOS port by metacollin, 2016

Ported to Linux by TGSoftware from metacollins' port, 2016

## Changelog
Initial release (11/27/2016)

## AUR (Arch User Repository) Package
AUR Link: https://aur.archlinux.org/packages/universal-ifr-extractor-linux-git/

The instructions for building and installing from the AUR are located here: https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages

The package is called universal-ifr-extractor-linux-git. You will need the `git` package (sudo pacman -S git) to clone the AUR repository and source repository for installing!

Basically, run the following commands (as a normal user, not as root):
```shell
mkdir -p ~/Documents/aur
cd ~/Documents/aur
pacman -S --needed base-devel # run if these tools are not installed on your Arch Linux system already
git clone https://aur.archlinux.org/universal-ifr-extractor-linux-git.git
tar -xvf universal-ifr-extractor-linux-git.tar.gz
cd universal-ifr-extractor-linux-git
makepkg -si # or makepkg -s and sudo pacman -U [makepkg output .tar.gz]
```

You can also use pamac, a GUI installer for AUR packages (which is installed by default on some Arch Linux distros, e.g. Antergos and Manjaro).

This package pulls the files from the latest git commit from the repository https://github.com/TGSoftware/Universal-IFR-Extractor-Linux, runs the cmake command to create a makefile which will create a binary called ifrextract, and installs the ifrextract binary to /usr/bin/ifrextract for use in the command line.

**WARNING: THIS METHOD MAY BE UNSTABLE OR BREAK AT ANY TIME**

## Build Instructions (from source)
Install the `cmake` (version 2.8+) and `clang` packages on Linux.

Run these commands in a shell/terminal:

``` sh
git clone https://github.com/TGSoftware/Universal-IFR-Extractor.git
cd Universal-IFR-Extractor
mkdir build && cd build
cmake ..
make
```

This will produce an executable called `ifrextract`.  It has no external files or dependencies, so feel free to copy it to your `/usr/local/bin` $PATH directory or simply run it in the directory it was built in (`./ifrextract`).

## Usage
From the location of the built binary:

``` sh
./ifrextract input_file # Will check the file type and output UEFI, EFI, or UNKNOWN

./ifrextract input_file output_file # Will proceed with generating a human readable extraction.
```

If installed as a package on Arch Linux or the built binary is moved to /usr/bin:
``` sh
ifrextract input_file # Will check the file type and output UEFI, EFI, or UNKNOWN

ifrextract input_file output_file # Will proceed with generating a human readable extraction.
```
