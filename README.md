# Patches for `libwacom` to support Microsoft Surface Devices

Patches to support Microsoft Surface Devices with `libwacom` and respective Arch Linux package.
This package is basically Geoff Holden's [fork][libwacom-geoffholden] of [`libwacom`][libwacom] in patch-form with a `PKGBUILD` for Arch Linux.

## Instructions

### Arch Linux

Simply use the provided `PKGBUILD`, i.e. clone this repository and then, inside this source directory, run

```shell
makepkg -si
```

Note: This package replaces the core `libwacom` package.

### Manual installation

Download [`libwacom`][libwacom], apply the patches, and compile.

[libwacom]: https://github.com/linuxwacom/libwacom
[libwacom-geoffholden]: https://github.com/geoffholden/libwacom
