# akagims-bin

Unofficial Arch Linux AUR package for the official x86_64 Linux releases of
[AkagiMS](https://github.com/shinkuan/AkagiMS), a Mahjong Soul AI assistant with
an integrated game window.

This repository contains packaging and GitHub Actions automation only. The
upstream repository publishes binaries, not application source code. This
package installs the unmodified Linux release executable and its notices;
SHA-256 checksums cover the release archive, upstream icon, launcher, and
desktop entry. Unlike `akagi-bin`, AkagiMS does not ship a Python/uv runtime.

## Installation

Build from this repository on Arch Linux:

```bash
makepkg -si
```

After the first successful AUR publication, install with an AUR helper:

```bash
paru -S akagims-bin
```

Or build the published recipe manually:

```bash
git clone https://aur.archlinux.org/akagims-bin.git
cd akagims-bin
makepkg -si
```

## Usage

Start **AkagiMS** from the application menu or run:

```bash
akagims
```

The launcher runs `/opt/akagims/akagi` without replacing `/usr/bin/akagi` or
using `/opt/akagi`. Both AUR packages can be installed together.

Upstream reuses Akagi's configuration directory name and WebKit application
identifier. The launcher isolates the XDG configuration, data, and cache
roots so the two applications do not share settings, login data, or caches:

| Content | Default location |
| --- | --- |
| Configuration | `~/.config/akagims/config.toml` |
| Logs and game history | `~/.config/akagims/logs/`, `~/.config/akagims/history/` |
| WebKit data, including the game session | `~/.local/share/akagims/com.akagi.akagi/` |
| Cache root | `~/.cache/akagims/` |

Custom `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, and `XDG_CACHE_HOME` values are
honored; the launcher appends `akagims` to each root. Runtime directories are
created with a private `umask`, and the application runs from its writable
configuration directory rather than the root-owned installation tree.

Pass a custom configuration file with the upstream CLI:

```bash
akagims --config ./my-config.toml
```

The launcher preserves paths relative to the caller for `--config`, `-c`,
attached short-option values, and `--config=...`. Custom configuration files
remain where specified; default runtime data still lives in the isolated
AkagiMS directory. Use absolute writable paths for non-default directory
entries inside custom configuration files.

Use your AUR helper to update the system installation. AkagiMS's portable
self-updater is not suitable for the root-owned `/opt/akagims` tree.
The package does not change system proxy settings or certificate trust.

## Package contents

- `/opt/akagims/`: the official executable, license, `NOTICE`, and portable README.
- `/usr/bin/akagims`: the isolated per-user launcher.
- `/usr/share/applications/akagims.desktop`: the application-menu entry.
- `/usr/share/icons/hicolor/scalable/apps/akagims.svg`: the upstream SVG icon.
- `/usr/share/licenses/akagims-bin/`: the upstream Apache-2.0 license and `NOTICE`.

The package requires GTK 3 and WebKit2GTK 4.1. An external Chromium browser
and Python/uv runtime are not required by this release.

## Update and publication automation

`.github/workflows/aur-publish.yml` follows the existing
[`ParticleG/akagi-bin`](https://github.com/ParticleG/akagi-bin) conventions.

Triggers:

- packaging changes pushed to `main`;
- a scheduled upstream check every six hours;
- an `upstream-release` `repository_dispatch` event;
- manual dispatch, with an optional `force_publish` input;
- pull requests, for build validation only.

For each run, the workflow:

1. fetches the latest stable `ms-<version>` release and Linux x64 archive;
2. downloads the upstream SVG icon from the same tag and calculates all source checksums;
3. updates `pkgver` and checksums, resetting `pkgrel` for a new version or
   incrementing it when sources change at the same version;
4. generates `.SRCINFO` and builds as an unprivileged user in an Arch Linux container;
5. installs the package in that disposable container and checks its launcher and desktop entry;
6. uploads the built `.pkg.tar.zst` as a GitHub Actions artifact;
7. commits recipe updates to GitHub and publishes the verified recipe to the AUR.

Only runs on `main` can commit or publish. Pull requests and manually selected
non-default branches cannot publish. A manual run with an unchanged recipe
publishes only when `force_publish` is enabled. Scheduled runs synchronize
the current recipe too, allowing a failed AUR push to be retried later.

AUR stores the package recipe and source integration files, not binaries.
Download built packages from the workflow's **Artifacts** section. Workflow
actions are pinned to commit hashes, as in the existing packaging repositories.

## Enable AUR publication

The public GitHub packaging repository is
[`ParticleG/akagims-bin`](https://github.com/ParticleG/akagims-bin).

1. Ensure your AUR account can publish `akagims-bin`: the name must be unclaimed,
   or your account must be an authorized maintainer. Register the corresponding
   SSH public key with that AUR account.
2. In **Settings → Secrets and variables → Actions**, add `AUR_SSH_PRIVATE_KEY`
   containing that authorized private key. Never commit the key. Repository
   secrets are not automatically copied from `akagi-bin`.
3. In **Actions**, run **Update, build, and publish AUR package** on `main`, with
   `force_publish` enabled, or rerun the initial push workflow after adding the secret.

A missing secret prevents AUR publication but does not prevent the preceding
build or artifact upload. The next scheduled run also attempts publication.

## Recipe maintenance

For packaging-only changes at the same upstream version, increment `pkgrel`.
Before building edited sources locally, refresh checksums using `updpkgsums`
from `pacman-contrib` and regenerate the metadata:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

The workflow performs these checksum and metadata updates automatically.

## License and attribution

AkagiMS is distributed under
[Apache-2.0](https://github.com/shinkuan/AkagiMS/blob/master/LICENSE.txt).
The package includes the exact license and third-party `NOTICE` from the
matching release. The upstream logo was designed by
[Sky](https://github.com/SKYisSKYisSKY), with copyright assigned to shinkuan;
the original attribution remains in the installed SVG.

This package is independently maintained and is not endorsed by the AkagiMS authors.
