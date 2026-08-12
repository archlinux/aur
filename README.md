# refindplus-bin

AUR package files for the upstream x64 RefindPlus binary release.

This package never modifies the EFI system partition during package
installation. It installs a complete staging tree under
`/usr/share/refindplus`, including the upstream release binaries plus
the matching source tag's icons, fonts, banners, keys, and sample configs. Run
`refindplus-install` explicitly when you want to copy those files to an ESP.

## Build

```sh
makepkg -si
```

## Install to an ESP

```sh
sudo refindplus-install --esp /boot
```

Normal installs also create a Boot Loader Specification entry at
`loader/entries/refindplus.conf` on the ESP, allowing BLS-compatible boot
managers such as systemd-boot to launch RefindPlus. Use `--no-loader-entry` to
skip it.

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
