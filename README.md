# openchamber-bin

OpenChamber Desktop packaged for Arch Linux using the official upstream Debian release.

## Installation

```bash
paru -S openchamber-bin
```

## Launch

```bash
openchamber-desktop
```

## Updates

Update through your AUR helper:

```bash
paru -Syu
```

The built-in application updater is not supported. Updates are distributed through the AUR.

## Packaging

- **Source:** Official upstream `.deb` release
- **Architecture:** x86_64
- **Install location:** `/opt/openchamber`
- **License:** MIT

The package includes desktop integration, an application launcher, and Chromium sandbox configuration.

## Uninstallation

```bash
sudo pacman -Rns openchamber-bin
```

## Disclaimer

Community-maintained AUR package. Not affiliated with or officially maintained by the OpenChamber project or Arch Linux.
