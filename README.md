# pencil-dev-bin (AUR Package)

![AUR](https://img.shields.io/aur/version/pencil-dev-bin?color=blue&style=flat-square)
![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?logo=arch-linux&logoColor=white&style=flat-square)

AUR package for **Pencil** (`pencil.dev`), pre-compiled binary distribution for Arch Linux.

> **Pencil** fundamentally increases your engineering speed by bringing designing directly into your preferred IDE. Design on canvas. Land in code.

## 📦 Installation

Since this package is now published on the AUR, you can install it using your favorite AUR helper (like `yay` or `paru`):

### Using yay

```bash
yay -S pencil-dev-bin
```


### Using paru

```bash
paru -S pencil-dev-bin
```


### Manual Installation (makepkg)

```bash
git clone https://aur.archlinux.org/pencil-dev-bin.git
cd pencil-dev-bin
makepkg -si
```


---

## 🛠️ Maintainer Guide: How to Update

This repository includes a convenient `update.sh` script to automate updating the package when a new version of Pencil is released.

1. Clone this repository locally (if you haven't already):

   ```bash
   git clone ssh://aur@aur.archlinux.org/pencil-dev-bin.git
   cd pencil-dev-bin
   ```


2. Run the update script:

   ```bash
   ./update.sh
   ```


**What `update.sh` does automatically:**
- Downloads the latest tarball release from `pencil.dev`.
- Extracts the new version number dynamically.
- Updates the `pkgver` and cryptographic hashes inside `PKGBUILD`.
- Generates a new `.SRCINFO` metadata file.

3. Commit and push the changes:

   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to <new_version>"
   git push origin master
   ```


---

## 🐛 Issues

If you encounter any issues with this package format, please leave a comment on the [AUR Package Page](https://aur.archlinux.org/packages/pencil-dev-bin). For issues with the software itself, please refer to the developers at [pencil.dev](https://www.pencil.dev/).
