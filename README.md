# `codex-app-electron-port-bin`

Unofficial AUR packaging files for running the Codex desktop app on Arch Linux using the system `electron` package (by extracting the macOS DMG and rebuilding required native modules).

## What This Repo Is

This repository contains the files used for the AUR package:

- `PKGBUILD`
- `.SRCINFO`
- launcher script
- native module rebuild helper
- desktop entry
- install message hook

AUR package page:

- https://aur.archlinux.org/packages/codex-app-electron-port-bin

## What This Package Does

- Downloads upstream `Codex.dmg`
- Extracts `app.asar` from the macOS app bundle
- Installs extracted app files under `/opt/codex-app-electron-port-bin`
- Launches the app with system `electron`
- Provides a helper script to rebuild native modules (`better-sqlite3`, `node-pty`) for the installed Electron version

## Important Notes

- This package is **unofficial** and not affiliated with OpenAI.
- First launch may fail until native modules are rebuilt.
- If your system `electron` version changes, rerun the rebuild helper.
- If upstream DMG layout changes, `PKGBUILD`/launcher may need updates.
- The DMG checksum is currently `SKIP` (recommended to pin a checksum in future updates).

## Why `sha256sums=('SKIP')` Is Intentional

This package intentionally leaves the upstream `Codex.dmg` checksum as `SKIP` so builds fetch the latest DMG available at the fixed upstream URL.

Tradeoff:

- Pro: lower maintenance for a fast-moving upstream binary
- Con: builds are less deterministic and do not verify DMG integrity at package build time

If upstream release cadence stabilizes (or a versioned download URL becomes available), pinning a checksum would be preferable.

## Install (AUR User Flow)

After installing the package from AUR, run:

```bash
sudo pacman -S --needed base-devel python nodejs pnpm sudo
pnpm setup
pnpm add -g @openai/codex
codex-app-electron-port-bin-rebuild-native
codex-app-electron-port-bin
```

Notes:

- `codex-app-electron-port-bin-rebuild-native` may prompt for your `sudo` password to update files under `/opt`.
- If `pnpm` blocks build scripts, run `pnpm approve-builds` and retry.
- Codex CLI install is recommended for app integration.

## Local Development / Testing

```bash
git clone https://github.com/Tomakin/codex-app-electron-port-bin.git
cd codex-app-electron-port-bin
makepkg -si
codex-app-electron-port-bin-rebuild-native
codex-app-electron-port-bin
```

## Maintenance Notes

- Update `pkgver`/`pkgrel` when packaging changes
- Regenerate `.SRCINFO` after `PKGBUILD` changes:

```bash
makepkg --printsrcinfo > .SRCINFO
```

- Validate on a clean Arch install/chroot before publishing updates

## License / Ownership

- Codex app binaries/assets/trademarks belong to their respective owners
- This repo only provides unofficial packaging metadata and helper scripts
