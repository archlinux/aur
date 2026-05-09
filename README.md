# claudectx-bin (AUR)

AUR package for [claudectx](https://github.com/foxj77/claudectx), a Claude context manager.

- **AUR page:** https://aur.archlinux.org/packages/claudectx-bin
- **Upstream:** https://github.com/foxj77/claudectx
- **Remote:** `ssh://aur@aur.archlinux.org/claudectx-bin.git`

## Updating the package

When the package is flagged out-of-date on the AUR, follow these steps.

### 1. Identify the latest upstream release

```sh
gh release list -R foxj77/claudectx --limit 5
```

Note the latest version tag (e.g. `v1.3.0`).

### 2. Download the release artifacts

Download the Linux amd64 tarball and the checksums file from the release:

```sh
VER=1.3.0  # set to the new version, without the leading "v"

curl -LO "https://github.com/foxj77/claudectx/releases/download/v${VER}/claudectx_${VER}_linux_amd64.tar.gz"
curl -LO "https://github.com/foxj77/claudectx/releases/download/v${VER}/checksums.txt"
```

### 3. Verify the tarball checksum

Confirm the downloaded tarball matches the upstream checksum:

```sh
sha256sum -c <(grep "claudectx_${VER}_linux_amd64.tar.gz" checksums.txt)
```

This should print `OK`. If it doesn't, re-download or investigate.

### 4. Compute sha256sums for PKGBUILD

Get the sha256 for both source files:

```sh
sha256sum "claudectx_${VER}_linux_amd64.tar.gz" checksums.txt
```

You'll need both values for the `sha256sums` array in `PKGBUILD`.

### 5. Update PKGBUILD

Edit `PKGBUILD` and change:

- **`pkgver`** to the new version (e.g. `1.3.0`)
- **`pkgrel`** to `1` (reset on every new upstream version; only increment for packaging-only changes at the same upstream version)
- **`sha256sums`** to the two checksums from step 4, in order: tarball first, then checksums.txt

The `source` URLs are templated with `${pkgver}`, so they update automatically.

### 6. Test the build

Run `makepkg` to verify everything downloads, validates, and installs correctly:

```sh
makepkg -f
```

You can also install the built package locally to smoke-test:

```sh
sudo pacman -U claudectx-bin-${VER}-1-x86_64.pkg.tar.zst
claudectx --version
```

### 7. Regenerate .SRCINFO

The AUR requires `.SRCINFO` to be committed alongside `PKGBUILD`. Regenerate it:

```sh
makepkg --printsrcinfo > .SRCINFO
```

### 8. Commit and push

The AUR remote only tracks `PKGBUILD` and `.SRCINFO`. Don't commit tarballs, build artifacts, or this README.

```sh
git add PKGBUILD .SRCINFO
git commit -m "update to v${VER}"
git push origin master
```

Pushing to the AUR remote automatically updates the package listing and clears the out-of-date flag.

## Files in this repo

| File | Tracked by AUR | Purpose |
|------|---------------|---------|
| `PKGBUILD` | Yes | Package build script |
| `.SRCINFO` | Yes | Metadata parsed by the AUR web interface |
| `README.md` | No | This file (local reference only) |
| `*.tar.gz` | No | Downloaded source tarballs (build artifacts) |
| `checksums.txt` | No | Upstream checksums (downloaded for verification) |
| `src/`, `pkg/`, `tmp/` | No | makepkg working directories |

## Reference

- [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- [PKGBUILD man page](https://man.archlinux.org/man/PKGBUILD.5)
- [makepkg man page](https://man.archlinux.org/man/makepkg.8)
