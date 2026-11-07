# wtp-bin

Arch Linux AUR packaging for the prebuilt `wtp` CLI release.

Upstream `wtp` is a Git worktree helper CLI. This repository packages the upstream Linux release as an Arch installable `-bin` package.

## How It Works

The `PKGBUILD` downloads the upstream tarball, extracts the `wtp` executable, installs it to `/usr/bin/wtp`, and keeps the upstream license when available.

## Install locally

```bash
makepkg -si
```

## Notes

- Packaging-only repository.
- Current packaged version is `2.10.6`.
- Target architecture is `x86_64`.
- Main files are `PKGBUILD` and `.SRCINFO`.
