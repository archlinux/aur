# clevo-indicator-git
This is an Arch Linux package forked from taner1's repository that lets you control the fan of Clevo laptops using reversed-engineering port information from ECView.

## Packages Used
libappindicator-gtk3 to display the tray icon (works with all desktop environments using GTK3, may not work with GNOME due to the [deprecation of GtkStatusIcon](https://bugzilla.gnome.org/show_bug.cgi?id=758677))

## AUR link
https://aur.archlinux.org/packages/clevo-indicator-git/

### Install instructions
#### Build and Install from the AUR (Arch Linux)
The instructions for building and installing from the AUR are located here: https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages

The package is called clevo-indicator-git. You will need the `git` package (sudo pacman -S git) to clone the AUR repository and source repository for installing!

Basically, run the following commands (as a normal user, not as root):
```shell
mkdir -p ~/Documents/aur
cd ~/Documents/aur
pacman -S --needed base-devel # run if these tools are not installed on your Arch Linux system already
git clone https://aur.archlinux.org/clevo-indicator-git.git
tar -xvf clevo-indicator-git.tar.gz
cd clevo-indicator-git
makepkg -si # or makepkg -s and sudo pacman -U [makepkg output .tar.gz]
```

You can also use pamac, a GUI installer for AUR packages (which is installed by default on some Arch Linux distros, e.g. Antergos and Manjaro).

This package pulls the files from the latest git commit from the repository https://github.com/taner1/clevo-indicator, runs the makefile, and installs them to /usr/bin/clevo-indicator for use in the command line.

**WARNING: THIS METHOD MAY BE UNSTABLE OR BREAK AT ANY TIME**

#### Build and Install from Source (Ubuntu/Arch Linux/other distros)

```shell
sudo apt-get install libappindicator-gtk3
git clone git@github.com:taner1/clevo-indicator.git
cd clevo-indicator
make install
```

## Command-line documentation
See the [DOCUMENTATION.md file](DOCUMENTATION.md).
