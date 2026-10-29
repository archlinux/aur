# squawker-vpn-bin (Arch Linux PKGBUILD)

Unofficial Arch Linux packaging for Squawker VPN, the VPN client provided by [TryHackMe](https://tryhackme.com).

This package installs the official precompiled upstream binary. It does **not** build the application from source.

## Installation

### Manual Installation

Install the standard Arch Linux build tools if they are not already installed:

```bash
sudo pacman -S --needed base-devel git
```

Clone the AUR repository, build, and install the package:

```bash
git clone https://aur.archlinux.org/squawker-vpn-bin.git
cd squawker-vpn-bin
makepkg -si
```

### Using an AUR Helper

Install the package using your preferred AUR helper:

```bash
yay -S squawker-vpn-bin
paru -S squawker-vpn-bin
pikaur -S squawker-vpn-bin
aura -A squawker-vpn-bin
...
```

[AUR helpers](https://wiki.archlinux.org/title/AUR_helpers) are community-maintained tools and are not included in a standard Arch Linux installation. Install your preferred helper separately before using it.

## Dependencies

The package declares the following dependencies:

- gtk3
- webkit2gtk-4.1
- libayatana-appindicator
- libappindicator

The dependencies provide the GTK interface, WebKit rendering, and application indicator support required by the application.

## Packaging Notes

The `PKGBUILD` downloads the upstream Debian package (.deb), verifies its checksum, extracts its contents, and packages the precompiled files for Arch Linux.

Packaging adjustments include:

- Relocating the systemd service from `/lib/systemd/system/` to `/usr/lib/systemd/system/`.
- Installing the upstream license in `/usr/share/licenses/squawker-vpn-bin/`.

The package also includes the application binary, helper binary, desktop entry, icons, and upstream resource files.

## Systemd Service

The package provides `squawker-vpn-helper.service`.

The package's installation hooks reload systemd and manage the service during installation, upgrades, and removal. The service is enabled and started during installation, restarted during upgrades if it was already active, and stopped and disabled before removal.

## Maintainer Utility

This repository includes `squawkver`, a Python script that checks the `pkgver` in the local `PKGBUILD` against the latest upstream Squawker VPN release.

### Usage

Run the script from the repository root:

```bash
python3 squawkver
# or, if it has executable permissions
./squawkver
```

To make it executable:

```bash
chmod +x squawkver
```

### Notes

- Intended as a maintainer convenience tool; it is not required to install or run Squawker VPN.
- The script is not installed system-wide by the package unless explicitly added to the `PKGBUILD`.
- Fetches the upstream version from TryHackMe's public [`latest.json`](https://squawker-vpn.vm.tryhackme.com/latest.json) endpoint.

## Reporting Issues

For issues specific to this Arch Linux package, such as installation failures, dependency problems, or packaging errors, open an issue in this repository or report the problem on the [AUR package page](https://aur.archlinux.org/packages/squawker-vpn-bin).

For issues with Squawker VPN itself, consult [TryHackMe's official Squawker VPN FAQ](https://help.tryhackme.com/en/articles/14624182-squawker-vpn-frequently-asked-questions).

## Disclaimer

Squawker VPN is provided by TryHackMe. This repository contains an unofficial, community-maintained Arch Linux package and is not affiliated with, endorsed by, or maintained by TryHackMe. All application trademarks and copyrights belong to their respective owners.
