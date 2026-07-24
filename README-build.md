# AUR Package Maintenance Guide

## Overview

This is the AUR packaging repository for **pulse-remote-git**. The actual source code lives at https://github.com/undg/pulse-remote.

**Important:** This is a `-git` VCS package. The `pkgver()` function in `PKGBUILD` automatically reads the [latest](https://github.com/undg/pulse-remote/releases/latest) upstream git tag. You do **not** edit `pkgver` by hand. You just run `makepkg` and it updates itself.

**Also important:** Always regenerate `.SRCINFO` after `PKGBUILD` changes. AUR reads `.SRCINFO` to display package metadata on the web interface. Forgetting this is the most common reason the AUR page shows the wrong version.

## Initial Setup

Clone the AUR repository (first time only):

```bash
git clone ssh://aur@aur.archlinux.org/pulse-remote-git.git
cd pulse-remote-git
```

## Standard Workflow

1. Pull the latest AUR state:

   ```bash
   git pull
   ```

2. Build the package. This runs `pkgver()` and fetches the latest upstream git tag:

   ```bash
   makepkg -f
   ```

3. Regenerate `.SRCINFO` from `PKGBUILD`:

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. Check what changed. You should see `pkgver` and possibly `pkgrel` updated in both `PKGBUILD` and `.SRCINFO`:

   ```bash
   git diff
   ```

5. Commit and push:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to version $(makepkg --printsrcinfo | grep pkgver | cut -d = -f 2)"
   git push
   ```

### Test Before Publishing

If you want to verify the new version before pushing to AUR:

```bash
# Build and install locally
makepkg -fi

# Restart the service to load the new version
systemctl --user restart pulse-remote.service

# Or enable and start if it is not running yet
systemctl --user enable --now pulse-remote.service

# Test that it works
curl http://localhost:8448

# If good, regenerate .SRCINFO and push
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Update to version $(makepkg --printsrcinfo | grep pkgver | cut -d = -f 2)"
git push
```

## Common Tasks

### Update checksums (if adding local source files)

```bash
makepkg -g  # Generates sha256sums
```

### Clean build artifacts

```bash
rm -rf pkg/ src/ *.pkg.tar.zst *-debug-*.pkg.tar.zst
```

### Nuclear clean (restore to git state)

```bash
git clean -xdf
```

### Check package metadata

```bash
makepkg --printsrcinfo  # Preview without writing
```

## Troubleshooting

### Version not updating on AUR?

- Make sure `.SRCINFO` was regenerated after `PKGBUILD` changes.
- Run `makepkg --printsrcinfo` and check that `pkgver` matches the latest upstream git tag.
- The `pkgver()` function only runs during `makepkg`; editing `PKGBUILD` by hand is not needed for this `-git` package.

### Build fails?

- Test against upstream: `cd /tmp && git clone https://github.com/undg/pulse-remote.git && cd pulse-remote && make build`
- Check Go package guidelines: https://wiki.archlinux.org/title/Go_package_guidelines

### Need to rollback?

```bash
git revert HEAD
git push
```

## Files Explained

- **PKGBUILD** - Package build script (the actual build instructions)
- **.SRCINFO** - Auto-generated metadata for AUR web interface
- **pulse-remote-git.install** - Install/upgrade hooks (post-install messages)
- **README-build.md** - This file
