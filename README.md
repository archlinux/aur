# gdlauncher-appimage
AUR package for [GDLauncher](https://gdevs.io)

Based off [hyper-appimage](https://aur.archlinux.org/packages/hyper-appimage).

## Why does this exist?
One day I decided to make this package. I was bored. No other reason :)

## How does this work?
I didn't even know this until I created the package, but if you run a AppImage with `--appimage-extract` it will extract all its contents into a `squashfs-root` folder.

From there, we can move the folder's contents into somewhere like `/opt/gdlauncher` and point a .desktop file to the executable, and we've just installed a appimage on our system!

## License
MIT (like GDLauncher itself)