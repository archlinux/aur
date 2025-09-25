# hale-studio-bin AUR Package

This repository contains a PKGBUILD for installing the hale studio application as a binary package on Arch Linux.

## How to update `sha256sums`
You can update the checksums automatically with:
```sh
updpkgsums
```
This will update the `sha256sums` array in your PKGBUILD in place.

Alternatively, to generate checksums manually:
```sh
makepkg -g
```
Then copy the output into the `sha256sums` array in the PKGBUILD.

## How to build and install locally
1. Install base-devel and git if not already installed:
   ```sh
   sudo pacman -S --needed base-devel git
   ```
2. Clone this repository and enter the directory:
   ```sh
   git clone <this-repo-url>
   cd aur-hale-studio-bin
   ```
3. Build the package:
   ```sh
   makepkg -si
   ```
   - The `-s` flag installs missing dependencies.
   - The `-i` flag installs the package after building.

**If you make changes to the PKGBUILD after building:**
- You must rebuild the package for changes to take effect.
- If the package does not update, force a rebuild with:
  ```sh
  makepkg -fsi
  ```
  The `-f` (force) flag overwrites any existing package file and ensures a full rebuild.
- Alternatively, clean up old build files first:
  ```sh
  makepkg -C
  makepkg -si
  ```

## How to update .SRCINFO
After making changes to the PKGBUILD, update the .SRCINFO file with:
```sh
makepkg --printsrcinfo > .SRCINFO
```
This ensures the AUR metadata is up to date and should be done before pushing changes to the AUR.

## How to uninstall
To remove the package, use pacman:
```sh
sudo pacman -R hale-studio-bin
```

## Notes
- The application will be installed to `/opt/hale-studio` and a launcher will be available as `hale-studio` in your application menu.
- If you update the version, also update the `pkgver`, `source`, and `sha256sums` fields in the PKGBUILD.
- For more details, see the [Arch Wiki: PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD) and [AUR guidelines](https://wiki.archlinux.org/title/Arch_User_Repository#Guidelines).
