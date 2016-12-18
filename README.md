# clevo-indicator-git
This is an Arch Linux package forked from SkyLandTW's repository that lets 
you control the fan of Clevo laptops using reversed-engineering port
information from ECView.

## Packages Used
libappindicator-gtk3 to display the tray icon (the tray icon doesn't show 
up on KDE, tested on Arch Linux)

## AUR link
https://aur.archlinux.org/packages/clevo-indicator-git/

### Install instructions
#### Build and Install from the AUR (Arch Linux)
```shell
sudo pacman -S clevo-indicator-git
```

This package pulls upstream git commits from the repository https://github.com/SkyLandTW/clevo-indicator.

**WARNING: THIS METHOD MAY BE UNSTABLE OR BREAK AT ANY TIME**

#### Build and Install from Source (Ubuntu/Arch Linux)

```shell
sudo apt-get install libappindicator-gtk3
git clone git@github.com:SkyLandTW/clevo-indicator.git
cd clevo-indicator
make install
```

## Command-line documentation
See the [DOCUMENTATION.md file](DOCUMENTATION.md).
