# arch-check (AUR package)

Minimal AUR package repository for the [arch-check](https://github.com/kidpixo/arch_check/) CLI. This repo contains packaging files only (PKGBUILD, .SRCINFO, LICENSE, Makefile). It is intended to build and install `arch_check` on Arch Linux using the upstream [GitHub release](https://github.com/kidpixo/arch_check/tags) tarball.

**Focus:** installing on Arch Linux (AUR workflow), updating hashes, and regenerating `.SRCINFO`.

## Install from this repository (local build)

Clone or download this repo and run:

```bash
cd arch-check-aur
makepkg -si
```

This will build the package from the upstream release tarball and install it (binary installed as `/usr/bin/arch_check`).

## Install from AUR

Use an AUR helper (e.g. `paru`, `yay`) to install from the AUR:

```bash
paru -S arch-check
# or
yay -S arch-check
```

## Maintainers / Upgrading

When releasing a new version in the upstream `arch-check` repository:

1. Tag and push a release in the upstream repository (e.g. `v0.2.1`).
2. Update `pkgver` (and optionally `pkgrel`) in `PKGBUILD` if not using version variables.
3. Update the source checksums and `.SRCINFO` locally by running:

```bash
cd arch-check-aur
make update_hashes    # runs `updpkgsums` to download sources and update sha256sums in PKGBUILD
make update_srcinfo   # regenerates .SRCINFO
```

4. Commit and push `PKGBUILD` and `.SRCINFO` to this repo (the AUR package repo).

Tip: `make update_all` runs both update steps.

## Verifying package build

To test the package locally (recommended before pushing to AUR):

```bash
cd arch-check-aur
makepkg -si
# or build without installing
makepkg -o
```

## Files in this repository

- `PKGBUILD` — build instructions and metadata (points to upstream GitHub release tarball).
- `.SRCINFO` — generated metadata used by AUR (keep in sync with `PKGBUILD`).
- `LICENSE` — license for the AUR packaging (also included in the package).
- `Makefile` — helper targets: `download_source`, `update_hashes`, `update_srcinfo`, `update_all`.

## Usage (short)

After installation, run the CLI for a full system check:

```bash
arch_check -a      # run all checks and show summary
arch_check --json  # machine-readable output
arch_check -d      # disk/origin checks only
```

## Notes

- The PKGBUILD downloads a tagged upstream release tarball. Keep `pkgver` and the tarball tag in sync.
- `updpkgsums` will download sources and update `sha256sums` in `PKGBUILD` automatically.
- `.SRCINFO` must be regenerated after any `PKGBUILD` change with `make update_srcinfo`.

If you want, I can open a small PR to commit this README and run `make update_srcinfo` to refresh `.SRCINFO` here.
