# aur-bluetooth-gpd

Arch Linux package of [bluetooth-gpd](https://github.com/goabonga/bluetooth-gpd),
a Linux Bluetooth manager made of a daemon and a terminal interface, with SBC
audio and an ALSA plugin, packaged for the AUR.

## Installation

```sh
makepkg -si
sudo systemctl mask --now bluetooth.service
sudo usermod -aG bluetooth "$USER"      # then log in again
sudo systemctl enable --now bluetooth-daemon
bluetooth
```

The package builds the tagged source of the upstream repository,
`https://github.com/goabonga/bluetooth-gpd/archive/refs/tags/v<pkgver>.tar.gz`,
against the [ctui](https://github.com/goabonga/ctui) package, which must be
installed first (it is on the AUR). The daemon is a system service that runs
as its own user, `bluetooth`, created by the package; systemd gives it the
`CAP_NET_ADMIN` capability the kernel requires to open its Bluetooth
management socket. The users of the group `bluetooth` reach it through the
sockets in `/run/bluetooth`. The package does not enable anything by
itself. BlueZ must be masked: it refuses the pairing requests the daemon
receives.

## What it installs

| File | Purpose |
| --- | --- |
| `/usr/bin/bluetooth` | the terminal interface |
| `/usr/bin/bluetooth-daemon` | the daemon that owns the adapter, the pairing keys and the connections |
| `/usr/lib/systemd/system/bluetooth-daemon.service` | system service of the daemon |
| `/usr/lib/sysusers.d/bluetooth-daemon.conf` | the user and group `bluetooth` |
| `/usr/lib/udev/rules.d/71-bluetooth-uhid.rules` | gives `/dev/uhid` to the group `bluetooth` |
| `/usr/lib/modules-load.d/bluetooth-daemon.conf` | loads the `uhid` module at boot |
| `/usr/lib/alsa-lib/libasound_module_pcm_bluetooth.so` | the `bluetooth` ALSA plugin |
| `/usr/share/alsa/alsa.conf.d/99-bluetooth.conf` | the PCMs `bluetooth_out` and `bluetooth_in` |

The keys, the control protocol and the audio PCMs are described in the
[upstream README](https://github.com/goabonga/bluetooth-gpd#readme).

## Update to a new release

Set `pkgver` (and `pkgrel=1`) to the new tag `v<pkgver>`, then:

```sh
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

## Verification

```sh
scripts/check-sums.sh
makepkg --force       # downloads the sources, builds them and runs the upstream tests
```
