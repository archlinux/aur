
To update the package:

- update home-assistant version in PKGBUILD
- update the sha256sum
- run makepkg -si
- ensure everything is running properly
- makepkg --printsrcinfo > .SRCINFO
