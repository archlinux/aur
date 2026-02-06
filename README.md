# AUR publishing

This repo includes a PKGBUILD template for AUR releases.

## GitHub Actions setup

Add these repo secrets:

- `AUR_SSH_PRIVATE_KEY`: SSH key with access to the AUR package repo
- `AUR_REPO`: AUR git URL (e.g. `ssh://aur@aur.archlinux.org/alogi.git`)

When a GitHub Release is published, the workflow will:

1) Download the linux-unpacked tarball from the release
2) Compute sha256
3) Update PKGBUILD + .SRCINFO
4) Push to the AUR repo

If you prefer manual publishing, copy `PKGBUILD` to your AUR repo and update `pkgver` + `sha256sums`.
