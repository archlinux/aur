# APRSTac AUR Package (`aprstac-bin`)

This repository contains the Arch User Repository (AUR) PKGBUILD for `aprstac-bin`, a pre-compiled binary package for APRSTac.

[APRSTac](https://aprstac.com/) is a modern APRS web client, digipeater, IGate, BBS, and fileshare application.

## Installation

You can install this package using any AUR helper, such as `yay` or `paru`:

```bash
yay -S aprstac-bin
```

Or manually with `makepkg`:

```bash
git clone https://aur.archlinux.org/aprstac-bin.git
cd aprstac-bin
makepkg -si
```

## Maintenance

This package is maintained by 9M2PJU (9m2pju@gmail.com).

To update the package when a new version is released:
1. Update `pkgver` in `PKGBUILD`.
2. Run `updpkgsums` to update the SHA256 hashes.
3. Run `makepkg --printsrcinfo > .SRCINFO` to regenerate the metadata.
4. Commit and push the changes.
