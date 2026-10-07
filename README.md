# akagi-bin

Unofficial Arch Linux AUR package for the official x86_64 Linux releases of
[Akagi](https://github.com/shinkuan/Akagi), a mahjong AI assistant supporting
Majsoul, Tenhou, Riichi City, and Amatsuki.

This repository contains packaging and GitHub Actions automation only. It
packages the upstream Linux binary rather than compiling Akagi from source.
The upstream executable and bundled Python/uv runtime are installed without
modification; SHA-256 checksums cover the release archive, upstream icon,
launcher, and desktop entry.

## Installation

Build from this repository on Arch Linux:

```bash
makepkg -si
```

After the first successful AUR publication, install with an AUR helper:

```bash
paru -S akagi-bin
```

Or build directly from the published AUR recipe:

```bash
git clone https://aur.archlinux.org/akagi-bin.git
cd akagi-bin
makepkg -si
```

## Usage

Start **Akagi** from the application menu or run:

```bash
akagi
```

The launcher creates private writable directories under
`${XDG_CONFIG_HOME:-$HOME/.config}/akagi` and starts Akagi from that directory.
This keeps configuration, logs, game history, CA certificates, and installed
bots out of the root-owned application directory. The upstream configuration
resolver writes `config.toml` into the same user configuration directory.

Pass a custom configuration file with the upstream CLI:

```bash
akagi --config ./my-config.toml
```

The launcher preserves configuration paths relative to the caller, including
`-c`, attached short-option values, and `--config=...`. Default runtime data
still lives in the user directory. For non-default directory entries inside
custom configuration files, use absolute paths to writable locations.

Use your AUR helper to update this system installation. Akagi's built-in
portable self-updater is not suitable for the root-owned `/opt/akagi` tree.
Proxy selection and certificate trust remain explicit upstream setup steps;
the package does not modify system proxy settings or trust stores.

## Package contents

- `/opt/akagi/`: the official executable, Python/uv runtime, and release notices.
- `/usr/bin/akagi`: the per-user launcher.
- `/usr/share/applications/akagi.desktop`: the application-menu entry.
- `/usr/share/icons/hicolor/256x256/apps/akagi.png`: the upstream application icon.
- `/usr/share/licenses/akagi-bin/`: the upstream Apache-2.0 license and `NOTICE`.

The package requires GTK 3 and WebKit2GTK 4.1. A system Python installation is
not required for the bundled runtime. `chromium` is an optional browser for
Chromium capture mode.

## Update and publication automation

`.github/workflows/aur-publish.yml` follows the conventions of the existing
`relink-logs-appimage` and `wegame-dwproton` packaging repositories.

Triggers:

- packaging changes pushed to `main`;
- a scheduled check every six hours;
- an `upstream-release` `repository_dispatch` event;
- manual dispatch, with an optional `force_publish` input;
- pull requests, for build validation only.

For each run, the workflow:

1. fetches the latest stable upstream release and its Linux x64 archive;
2. downloads the icon from the same release tag and calculates all source checksums;
3. updates `pkgver` and checksums, resetting `pkgrel` for a new version or
   incrementing it when sources change at the same version;
4. generates `.SRCINFO` and builds as an unprivileged user in an Arch Linux container;
5. installs the package in that disposable container and checks the launcher,
   desktop entry, bundled Python modules, and uv executable;
6. uploads the built `.pkg.tar.zst` as a GitHub Actions artifact;
7. commits recipe updates to GitHub and publishes the verified recipe to the AUR.

Only runs on `main` can commit or publish. Pull requests and manually selected
non-default branches cannot publish. A manual run with an unchanged recipe
publishes only when `force_publish` is enabled; scheduled runs also synchronize
the current recipe, so a failed AUR push can be retried on the next run.

AUR stores `PKGBUILD`, `.SRCINFO`, and source integration files, not binary
packages. Download built binaries from the workflow's **Artifacts** section.
GitHub Actions in this workflow are pinned to commit hashes, matching the
existing packaging repositories.

## Enable publication

1. Ensure your AUR account can publish `akagi-bin`: the package name must be
   unclaimed, or your account must be an authorized maintainer. Register the
   corresponding SSH public key with that AUR account.
2. Commit the packaging files and create the GitHub repository without pushing
   the workflow yet:

   ```bash
   git add PKGBUILD .SRCINFO .gitignore README.md akagi akagi.desktop .github/workflows/aur-publish.yml
   git commit -m "Add Akagi binary packaging and AUR automation"
   gh repo create akagi-bin --public --source=. --remote=origin
   ```

3. In the new repository's **Settings → Secrets and variables → Actions**, add
   `AUR_SSH_PRIVATE_KEY` containing the authorized SSH private key. This uses the
   same secret name as the existing AUR projects; secrets are not automatically
   copied between repositories. Never commit the private key.
4. Allow GitHub Actions to write repository contents, then push `main`:

   ```bash
   git push -u origin main
   ```

The first push starts the workflow. No GitHub or AUR repository is created by
merely building the package locally.

## Recipe maintenance

When changing packaging without changing the upstream version, increment
`pkgrel`. Before building edited sources locally, refresh checksums with
`updpkgsums` (provided by `pacman-contrib`) and regenerate the AUR metadata:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

The automation performs checksum refreshes and metadata generation itself.

## License and attribution

Akagi is distributed under
[Apache-2.0](https://github.com/shinkuan/Akagi/blob/v3/LICENSE.txt). Its upstream
`NOTICE` is included in the package. The bundled runtime and third-party
components retain the license files supplied in the official release archive.
This package is independently maintained and is not endorsed by the Akagi authors.
