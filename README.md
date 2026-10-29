# nuphyctl-bin

Arch Linux package for [nuphyctl](https://github.com/fldc/nuphyctl) - a Rust CLI for sending NuPhy keyboard HID commands.

## Installation

```bash
yay -S nuphyctl-bin
# or
paru -S nuphyctl-bin
```

## Device permissions

The package installs `70-nuphyctl.rules` to grant the active local seat user
read/write access to NuPhy USB HID devices (vendor ID `19f5`) via systemd-logind.
No root execution, extra group membership, or world-writable permissions are needed.
Keyboards plugged in before login are covered too.

Arch's standard pacman hook reloads udev rules and retriggers connected devices.
If you have disabled automatic retriggering, replug the keyboard once or run:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger --subsystem-match=hidraw --property-match=ID_VENDOR_ID=19f5 --action=change
sudo udevadm settle
```

Access is limited to active local seat sessions, not SSH-only sessions.
The rule is also shipped by upstream in newer release archives; when updating
to one of those releases, keep the packaged rule in sync with upstream.

## Manual build

```bash
git clone https://aur.archlinux.org/nuphyctl-bin.git
cd nuphyctl-bin
makepkg -si
```

## Updating

To update this package to a new version:

```bash
./update-aur.sh 0.6.0
```

## Files

- `PKGBUILD` - Package build script
- `.SRCINFO` - Package metadata for AUR
- `.gitignore` - Git ignore rules
- `update-aur.sh` - Helper script for updates
