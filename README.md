# yubihsm-manager (AUR)

Arch Linux packaging for [yubihsm-manager](https://github.com/Yubico/yubihsm-manager),
Yubico's command line management tool for the YubiHSM 2.

AUR page: https://aur.archlinux.org/packages/yubihsm-manager

## Build

```sh
makepkg -si
```

Links dynamically against the `libyubihsm` and `openssl` packages from the
official Arch repositories.

## Updating

1. Bump `pkgver` in `PKGBUILD`, reset `pkgrel` to 1
2. `makepkg -g` and update `sha256sums`
3. `makepkg -f` to test the build
4. `makepkg --printsrcinfo > .SRCINFO`
5. Commit and push to AUR and GitHub
