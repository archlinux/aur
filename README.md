# hyper-appimage

Arch package for hyper based on the AppImage.

Based on the existing [upwork-appimage](https://aur.archlinux.org/packages/upwork-appimage/).

## Why?

The `hyper` package from AUR installs NPM, Yarn, NodeJS and Electron just to install, which is not
ideal for me as I want to control my own versions of those softwares and not have one package
pollute that.

## How does it work?

This works by downloading the AppImage distribution for Hyper and then extracting the `app/`
directory out of that (which contains fully working binary).

This means we don't need to compile the application and can just use it out of the AppImage.

This may not be as intended, but sure works a treat.
