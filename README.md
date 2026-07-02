# squawker-vpn-bin (Arch PKGBUILD)

Unofficial Arch Linux package (PKGBUILD) for the Squawker VPN client provided by TryHackMe.

This package does not build from source but installs an official precompiled binary.

## Installation

```bash
# Manual
git clone https://github.com/Ashintosh/squawker-vpn-bin.git
cd squawker-vpn-bin
makepkg -si

# AUR helper
yay -S squawker-vpn-bin
# or
paru -S squawker-vpn-bin
```

## Dependencies
- gtk3
- webkit2gtk-4.1
- libayatana-appindicator
- libappindicator

## Notes
This package extracts and repackages the upstream `.deb` and applies filesystem adjustments required for Arch Linux compatibility:
- `/lib` -> `/usr/lib`
- `/lib/systemd` -> `/usr/lib/systemd`

This is not an official package and is not affiliated with TryHackMe.