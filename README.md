# refindplus-bin

AUR package files for the upstream x64 RefindPlus binary release.

This package deliberately does not modify the EFI system partition during
package installation. It installs a complete staging tree under
`/usr/share/refindplus/refindplus`, including the upstream release binaries plus
the matching source tag's icons, fonts, banners, keys, and sample configs.

## Build

```sh
makepkg -si
```

## Install to an ESP

```sh
sudo refindplus-install --esp /boot
```

For fallback/removable-media layout:

```sh
sudo refindplus-install --esp /boot --fallback
```

To also create a UEFI NVRAM boot entry:

```sh
sudo refindplus-install --esp /boot --register
```

Existing `config.conf` files on the ESP are preserved. If one already exists,
the packaged config is written as `config.conf-sample`.
