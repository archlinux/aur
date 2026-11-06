# hotkeys-gpd

Arch Linux package of [hotkeys-gpd](https://github.com/goabonga/hotkeys-gpd),
the `gpd-hotkeysd` daemon for the hotkeys of the GPD Pocket, packaged for the AUR.
The daemon needs no desktop environment (text console, cage, plain ALSA).

## Installation

```sh
makepkg -si
sudo udevadm control --reload
sudo udevadm trigger -s backlight -c add   # brightness writable by the video group
sudo systemctl enable --now gpd-hotkeysd
```

The package builds the tagged source of the upstream repository,
`https://github.com/goabonga/hotkeys-gpd/archive/refs/tags/v<pkgver>.tar.gz`.
It does not enable anything by itself.

## What it installs

| File | Purpose |
| --- | --- |
| `/usr/bin/gpd-hotkeysd` | the daemon |
| `/usr/lib/systemd/system/gpd-hotkeysd.service` | unit running it without root (dynamic user, groups `input`, `audio`, `video`) |
| `/usr/lib/udev/rules.d/90-gpd-hotkeys.rules` | makes `/sys/class/backlight/*/brightness` writable by the `video` group |
| `/etc/gpd-hotkeysd.conf` | commented example with the default values, kept on upgrade |

The keys, the configuration and the state file are described in the
[upstream README](https://github.com/goabonga/hotkeys-gpd#readme).

Reload the configuration with `sudo systemctl reload gpd-hotkeysd`. Follow the
daemon with `journalctl -u gpd-hotkeysd -f`.

## Verification

```sh
scripts/check-sums.sh
makepkg --force       # downloads the tagged source, builds it and runs the upstream tests
```
