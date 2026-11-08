# aur-ctui

Arch Linux package of [ctui](https://github.com/goabonga/ctui), a C library
of reusable ncursesw terminal user interface components, packaged for the AUR.

## Installation

```sh
makepkg -si
```

The package builds the tagged source of the upstream repository,
`https://github.com/goabonga/ctui/archive/refs/tags/v<pkgver>.tar.gz`.

## What it installs

| File | Purpose |
| --- | --- |
| `/usr/include/ctui/*.h` | the public headers, `ctui/ctui.h` includes them all |
| `/usr/lib/libctui.so.0` | the shared library, with `libctui.so` for the linker |
| `/usr/lib/libctui.a` | the static library |
| `/usr/lib/pkgconfig/ctui.pc` | the pkg-config file |

Build against it with:

```sh
cc app.c $(pkg-config --cflags --libs ctui) -o app
```

## Update to a new release

Set `pkgver` (and `pkgrel=1`) to the new tag `v<pkgver>`, then:

```sh
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

## Verification

```sh
scripts/check-sums.sh
makepkg --force       # downloads the tagged source, builds it and runs the upstream tests
```
