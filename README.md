# lynx-devtool

Arch Linux AUR package for [Lynx DevTool](https://github.com/lynx-family/lynx-devtool)

## Install

```sh
yay -S lynx-devtool
```

Or manually:

```sh
git clone https://aur.archlinux.org/lynx-devtool.git
cd lynx-devtool
makepkg -si
```

## Update Version

1. Update `pkgver` in `PKGBUILD`
2. Download sources and update checksums:
```sh
updpkgsums
```
3. Regenerate `.SRCINFO`:
```sh
makepkg --printsrcinfo > .SRCINFO
```

## Lint

```sh
namcap PKGBUILD
```
