# wine-arm64ec-git

Wine with experimental ARM64EC support for Arch Linux ARM (aarch64).

## Description

This package provides Wine compiled with ARM64EC support, enabling Windows x86 and x86_64 applications to run on ARM64 Linux systems (such as Asahi Linux on Apple Silicon). This is based on the work from the Fedora COPR repository by lacamar.

## Features

- Wine compiled from git source
- Wine-staging patches applied
- ARM64EC support patches from bylaws
- NTSync support for better performance
- Supports running Windows 32-bit and 64-bit applications on ARM64

## Dependencies

This package requires `fex-emu-wine-git` to be installed first, as it provides the FEX DLLs needed for ARM64EC emulation.

## Installation

1. First build and install `fex-emu-wine-git`
2. Then build this package:

```bash
cd wine-arm64ec-git
makepkg -si
```

## Post-Installation

After installation, you need to load the ntsync kernel module:

```bash
sudo modprobe ntsync
```

To load it automatically at boot:

```bash
echo 'ntsync' | sudo tee /etc/modules-load.d/ntsync.conf
```

Then update your wine prefix:

```bash
wineboot -u
```

## Notes

- This is experimental software and may be unstable
- Many applications may not work correctly
- Performance varies depending on the application
- Requires aarch64 16k page size kernel (default on Asahi Linux)

## Credits

- Based on work by lacamar: https://github.com/lacamar/wine-arm64ec-rpm
- ARM64EC patches by bylaws: https://github.com/bylaws/wine
- Wine project: https://www.winehq.org/
- Wine-staging: https://github.com/wine-staging/wine-staging

## License

Wine is licensed under LGPL-2.1-or-later
