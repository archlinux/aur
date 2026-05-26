# ethereal-appimage

AUR package that wraps the official [Ethereal](https://github.com/quetrea/ethereal-releases) AppImage release for Arch Linux and derivatives (CachyOS, Manjaro).

## What this installs

| Path | Contents |
|---|---|
| `/opt/ethereal/Ethereal.AppImage` | The application |
| `/usr/bin/ethereal` | Symlink to the AppImage |
| `/usr/share/polkit-1/actions/` | Three polkit policies (hosts, workspace, netguard) |
| `/usr/share/icons/hicolor/128x128/apps/` | App icon |
| `/usr/share/applications/ethereal.desktop` | Desktop entry |
| `/usr/share/licenses/ethereal-appimage/LICENSE` | MIT license |

## Install

```sh
yay -S ethereal-appimage
```

## After install

Run `ethereal`. Polkit policies are active immediately — enforcement features work on first run.

### Website blocking (optional)

The `netguardd` systemd daemon is **not** installed automatically. To set it up manually, see [the docs](https://github.com/quetrea/ethereal#linux-polkit-setup).

### Hardened kernels

Some CachyOS kernel configs restrict user namespaces, which breaks FUSE. If the app fails to launch:

```sh
ethereal --appimage-extract-and-run
```

## Maintenance

This package is maintained alongside [quetrea/ethereal](https://github.com/quetrea/ethereal). Version bumps are automated via `updpkgsums` + `makepkg --printsrcinfo` as part of the release pipeline.

### Bootstrap note (v1.4.8 only)

`LICENSE` is committed as a local file in this AUR repository because the v1.4.8 tar.gz did not include it. Starting with v1.4.9+, `LICENSE` will be extracted from the tar.gz automatically and the local copy will be removed.
