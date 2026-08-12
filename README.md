# luatos-cli-bin

Unofficial Arch Linux AUR package for the official x86_64 prebuilt binaries of
[LuatOS CLI](https://github.com/wendal/luatos-cli), a pure-Rust command-line
toolkit for LuatOS development: flashing, serial logging, project management,
firmware resources, and building.

This repository contains packaging and release-automation metadata only. The
package downloads the unmodified x86_64 GNU Linux tarball and license from the
corresponding upstream GitHub Release, verifies their SHA-256 checksums, and
installs the binary as `luatos-cli`.

## Installation

Install from the AUR with an AUR helper:

```bash
paru -S luatos-cli-bin
```

Or build the package manually:

```bash
git clone https://aur.archlinux.org/luatos-cli-bin.git
cd luatos-cli-bin
makepkg -si
```

## Usage

```bash
luatos-cli --help
luatos-cli guide models
luatos-cli flash run --soc firmware.soc --port COM10
luatos-cli log view --port COM6 --baud 921600
```

See the upstream [README](https://github.com/wendal/luatos-cli#readme) for the
full command reference.

## Package contents

- The upstream binary is installed at `/usr/bin/luatos-cli`.
- The upstream MIT license is installed under `/usr/share/licenses/luatos-cli-bin/`.
- `libudev.so` (provided by `systemd-libs`) is required by the installed binary
  for serial port enumeration.

## Update automation

The GitHub Actions workflow in `.github/workflows/aur-publish.yml` checks the
latest stable upstream release every six hours. It can also be triggered
manually or with an `upstream-release` `repository_dispatch` event.

For each release, the workflow:

1. downloads the matching `luatos-cli-x86_64-unknown-linux-gnu.tar.gz` and the
   upstream license;
2. calculates and records their SHA-256 checksums;
3. updates `pkgver`, `pkgrel`, the original release tag, and `.SRCINFO`;
4. builds and validates the package in an isolated Arch Linux container;
5. commits recipe changes to GitHub and publishes the verified recipe to the AUR.

Publishing requires an `AUR_SSH_PRIVATE_KEY` GitHub Actions secret containing
an SSH private key authorized for the AUR package repository.

## Credits

- [wendal/luatos-cli](https://github.com/wendal/luatos-cli) — the upstream
  LuatOS CLI project and provider of the packaged binary releases.

All application code, names, and release artifacts belong to their respective
upstream projects and contributors. This AUR package is maintained
independently and is not endorsed by the LuatOS CLI authors.

## License

LuatOS CLI is distributed under the
[MIT License](https://github.com/wendal/luatos-cli/blob/main/LICENSE). The package
installs a copy of the license supplied by the matching upstream release.
