# ffuosprint-bin

Arch Linux AUR packaging for the FUJIFILM Printer Driver for UOS.

The upstream license bundled with the driver restricts redistribution of the
software archive. For that reason this AUR package does not include the driver
archive in git; it downloads the archive from FUJIFILM's official support site
at build time.

## Build

Build and install:

```sh
makepkg -si
```

After installation, restart CUPS:

```sh
sudo systemctl restart cups.service
```

Then add the printer through CUPS or your desktop printer settings and select:

- Manufacturer: `FUJIFILM`
- Model: `PDF Print Driver for UOS`

## Notes

- This packages the vendor's prebuilt UOS x86_64 CUPS filters and PPD for Arch
  Linux.
- The original Debian package declares a `deepin-elf-verify` dependency. It is
  not required for runtime on Arch Linux; the included filters link against
  `libcups` and `glibc`.
- Authentication print is not supported by the upstream driver.
