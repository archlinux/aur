# relink-logs-appimage

Unofficial Arch Linux AUR package for the official x86_64 AppImage releases
of [Relink Logs](https://github.com/villith/relink-logs), an overlay DPS parser
and meter for Granblue Fantasy: Relink.

This repository contains packaging and release-automation metadata only. The
package downloads the unmodified AppImage and license from the corresponding
upstream GitHub Release, verifies their SHA-256 checksums, and installs the
application as `gbfr-logs`.

## Installation

Install from the AUR with an AUR helper:

```bash
paru -S relink-logs-appimage
```

Or build the package manually:

```bash
git clone https://aur.archlinux.org/relink-logs-appimage.git
cd relink-logs-appimage
makepkg -si
```

## Usage

Start **GBFR Logs** from the application menu or run:

```bash
gbfr-logs
```

Relink Logs runs natively on Linux and meters Granblue Fantasy: Relink running
through Steam Proton. Follow the upstream
[Linux installation instructions][upstream-linux] to install the hook and
configure the required Steam launch options.

The overlay uses X11, including XWayland on Wayland desktops. Always-on-top and
click-through behavior depends on the compositor; an X11 session is the most
reliable option. Steam Deck gaming mode is not supported because external
overlays cannot draw over gamescope.

## Package contents

- The upstream AppImage is installed at `/opt/relink-logs-appimage/gbfr-logs.AppImage`.
- `/usr/bin/gbfr-logs` points to the installed AppImage.
- The upstream desktop entry and 32, 128, and HiDPI 256 scale-2 icons are
  installed in the corresponding XDG locations.
- The upstream MIT license is installed under `/usr/share/licenses/relink-logs-appimage/`.
- `fuse2` provides the AppImage runtime support required by the installed binary.

## Update automation

The GitHub Actions workflow in `.github/workflows/aur-publish.yml` checks the
latest stable upstream release every six hours. It can also be triggered
manually or with an `upstream-release` `repository_dispatch` event.

For each release, the workflow:

1. downloads the matching `gbfr-logs_<version>_amd64.AppImage` and upstream license;
2. calculates and records their SHA-256 checksums;
3. updates `pkgver`, `pkgrel`, the original release tag, and `.SRCINFO`;
4. builds and validates the package in an isolated Arch Linux container;
5. commits recipe changes to GitHub and publishes the verified recipe to the AUR.

Publishing requires an `AUR_SSH_PRIVATE_KEY` GitHub Actions secret containing
an SSH private key authorized for the AUR package repository.

## Credits

- [villith/relink-logs](https://github.com/villith/relink-logs) — the actively
  maintained Relink Logs project and provider of the packaged AppImage
  releases.
- [false-spring/gbfr-logs](https://github.com/false-spring/gbfr-logs) — the
  original GBFR Logs project on which Relink Logs was built. The original
  project is no longer maintained; Relink Logs is an independent continuation
  and is not affiliated with it.
- [nyaoouo/GBFR-ACT](https://github.com/nyaoouo/GBFR-ACT) — the
  reverse-engineering work on which the original GBFR Logs implementation was
  based.

All application code, names, icons, and release artifacts belong to their
respective upstream projects and contributors. This AUR package is maintained
independently and is not endorsed by the Relink Logs authors, Cygames, or the
Granblue Fantasy: Relink publishers.

## License

Relink Logs is distributed under the
[MIT License](https://github.com/villith/relink-logs/blob/dev/LICENSE). The
package installs a copy of the license supplied by the matching upstream
release.

[upstream-linux]: https://github.com/villith/relink-logs#linux-proton
