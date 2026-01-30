# dmenu-xft-emoji

**dmenu** with native color-font (emoji) rendering and automatic CJK fallback (漢字、かな、カタカナ). Built on top of dmenu 5.4 with a small patch set and a cascading font stack (`Terminus → Noto Sans CJK JP → Noto Color Emoji → monospace`).

## Features

* **Emoji support** via the *allow‑color‑font* patch.
* Seamless fallback for Chinese, Japanese and Korean glyphs.
* Lean, easy‑to‑edit `config.h`.
* Arch Linux package (`PKGBUILD`) that **provides dmenu** and can fully replace the stock build.
* Upstream repo is tagged, making builds reproducible.

## Installation

### AUR (recommended)

```bash
paru -S dmenu-xft-emoji      # or yay / pikaur / aurutils …
```

### Manual build

```bash
git clone https://github.com/limaon/dmenu-xft-emoji.git
cd dmenu-xft-emoji
make
sudo make install           # PREFIX=/usr by default
```

> **Runtime deps**: `libxft`, `libxinerama`, `fontconfig`
> **Suggested fonts**: `terminus-font`, `noto-fonts`, `noto-fonts-cjk`, `noto-fonts-emoji`

## Quick test

```bash
echo -e "Hello 👋\nこんにちは" | dmenu -i
```

If both the emoji and the Kanji render, fallback is working.

## Customisation

Adjust the font cascade in `config.h`:

```c
static const char *fonts[] = {
    "Terminus:size=14:antialias=true:autohint=true",
    "Noto Sans CJK JP:size=14:antialias=true:autohint=true",
    "Noto Color Emoji:size=14:antialias=true:autohint=true",
    "monospace:size=14"
};
```

Rebuild:

```bash
make clean install
```

## Updating from Upstream

This project tracks the official dmenu from [suckless.org](https://git.suckless.org/dmenu). Here's the complete workflow for updating to a new upstream version.

### Initial Setup (one-time)

```bash
# Add upstream remote
git remote add upstream https://git.suckless.org/dmenu

# Verify remotes
git remote -v
# Expected:
# aur       ssh://aur@aur.archlinux.org/dmenu-xft-emoji.git
# github    git@github.com:limaon/dmenu-xft-emoji.git
# upstream  https://git.suckless.org/dmenu
```

### Manual Update Process

#### Step 1: Fetch and create update branch

```bash
# Fetch latest tags from upstream
git fetch upstream

# List available versions
git tag -l | sort -V | tail -10

# Create branch from desired version (e.g., 5.4)
git checkout -b update-to-5.4 5.4
```

#### Step 2: Apply customizations

```bash
# Get clean patch file from master
git checkout master -- dmenu-allow-color-font-5.4.diff

# Apply the color-font patch
patch -Np1 -i dmenu-allow-color-font-5.4.diff

# Copy custom config
git checkout master -- config.h

# Copy project files
git checkout master -- PKGBUILD README.md .github
```

#### Step 3: Commit and merge

```bash
# Stage and commit
git add -A
git commit -m "Apply color-font patch and custom config for dmenu 5.4"

# Merge into master
git checkout master
git merge update-to-5.4 --allow-unrelated-histories -m "Merge update-to-5.4"

# Push to GitHub
git push github master

# Cleanup
git branch -D update-to-5.4
```

### Adapting Patch for New Version

If the patch doesn't apply cleanly to a new version:

```bash
# Download new dmenu source
curl -LO https://dl.suckless.org/tools/dmenu-X.Y.tar.gz
tar -xzf dmenu-X.Y.tar.gz
cd dmenu-X.Y

# Apply old patch manually, fix conflicts
patch -Np1 < ../dmenu-allow-color-font-OLD.diff

# Create new patch
cd ..
cp -r dmenu-X.Y dmenu-X.Y.orig
# (make changes to dmenu-X.Y)
diff -Naur dmenu-X.Y.orig dmenu-X.Y > dmenu-allow-color-font-X.Y.diff
```

### Updating Checksums

After modifying patch or config files:

```bash
# Calculate new checksums
sha256sum dmenu-allow-color-font-*.diff config.h

# Update PKGBUILD sha256sums array accordingly
```

## Syncing to AUR

Since AUR doesn't allow subdirectories (like `.github/`), use this workflow to sync updates:

```bash
# Create clean branch from AUR
git checkout -b aur-sync aur/master

# Copy only AUR-compatible files from master
git checkout master -- PKGBUILD config.h dmenu-allow-color-font-*.diff README.md

# Update .SRCINFO (must match PKGBUILD)
# Edit .SRCINFO with new version, checksums, and source files

# Commit and push to AUR
git add -A
git commit -m "Update to dmenu X.Y"
git push aur aur-sync:master

# Clean up
git checkout master
git branch -D aur-sync
```

### .SRCINFO Format

The `.SRCINFO` file must be manually updated to match `PKGBUILD`:

```
pkgbase = dmenu-xft-emoji
	pkgdesc = dmenu with color-font (emoji) and CJK fallback support
	pkgver = 5.4
	pkgrel = 1
	url = https://tools.suckless.org/dmenu/
	arch = x86_64
	license = MIT
	depends = libxft
	depends = libxinerama
	depends = fontconfig
	optdepends = terminus-font: bitmap Terminus for X11
	source = https://dl.suckless.org/tools/dmenu-5.4.tar.gz
	source = dmenu-allow-color-font-5.4.diff
	source = config.h
	sha256sums = <dmenu-tarball-checksum>
	sha256sums = <patch-checksum>
	sha256sums = <config-checksum>

pkgname = dmenu-xft-emoji
```

## Automated Updates

This repository includes a GitHub Actions workflow (`.github/workflows/update-dmenu.yml`) that:

- Checks daily for new dmenu versions
- Automatically creates PRs with updated PKGBUILD and adapted patches
- Calculates checksums automatically

After merging an automated PR, manually sync to AUR using the workflow above.

## Contributing

1. **Fork** and create a topic branch: `git checkout -b feature/name`.
2. Commit in logical chunks with clear English messages.
3. Open a pull request against `main`.
4. Use the issue tracker for questions or bug reports.

## License

Released under the MIT License. See `LICENSE` for details.
