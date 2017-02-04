
# To update the package:

- update home-assistant version in PKGBUILD
- update the sha256sum
- run makepkg -si
- ensure everything is running properly
- makepkg --printsrcinfo > .SRCINFO

# Helper: update.sh

You can run `update.sh` to run all these actions automatically.
It will:
- fetch the latest home-assistant version (if none specified)
- update the PKGBUILD
- build the package and install it
- wait for xx seconds to let home-assistant restart and display service status
