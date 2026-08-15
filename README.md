# chemcanvas-bin

AUR package definition for [`chemcanvas`](https://github.com/ksharindam/chemcanvas),
a user-friendly 2D chemical structure drawing tool, installed from the
upstream precompiled AppImage release rather than built from source.

This repo is the source for the [`chemcanvas-bin` AUR
package](https://aur.archlinux.org/packages/chemcanvas-bin) — it doesn't
contain the application itself, just the recipe (`PKGBUILD`) that downloads,
unpacks, and installs it for Arch Linux.

## Layout

- `PKGBUILD` — the package build recipe: version, checksums, and the
  `package()` step run by `makepkg`. There's no `build()` step — the AppImage
  ships precompiled; `package()` just installs it as `/usr/bin/chemcanvas`
  and pulls the bundled `.desktop` file and icon out of it (via
  `--appimage-extract`) so the app shows up in application menus.
- `.SRCINFO` — generated metadata read by the AUR and AUR helpers (`yay`,
  `paru`, ...). Must stay in sync with `PKGBUILD`.
- `Dockerfile` — builds the package in a disposable Arch Linux container, for
  testing changes without touching the host system.
- `dist/`, `pkg/`, `src/` — local build output from running `makepkg`
  directly (untracked, safe to delete).

## Building locally (Arch Linux)

```bash
makepkg -si
```

This downloads the upstream AppImage for your architecture (`x86_64` or
`aarch64`), verifies its checksum, and installs it. No compiler or
build-time dependencies needed.

> [!NOTE]
> `options=('!strip')` is required in `PKGBUILD`. The AppImage is a single
> ELF binary with a squashfs filesystem appended to it; makepkg's default
> stripping pass corrupts that appended data (it silently truncated the
> 38MB AppImage down to under 1MB in testing). Don't remove that line.

## Building in Docker (no Arch host needed)

```bash
docker build -t chemcanvas-bin-test .
mkdir -p dist
docker run --rm -v "$PWD/dist:/out" chemcanvas-bin-test
```

The resulting `chemcanvas-bin-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst` lands in
`./dist`. Useful for validating a version bump before publishing.

## Bumping the package version

1. Check the [latest release](https://github.com/ksharindam/chemcanvas/releases)
   for the new tag (e.g. `v0.14.9`) and update `pkgver` (drop the leading
   `v`); reset `pkgrel=1`.
2. Update `sha256sums_x86_64` / `sha256sums_aarch64` to match the new
   `ChemCanvas-x86_64.AppImage` / `ChemCanvas-aarch64.AppImage` assets —
   the GitHub release API returns these directly:
   ```bash
   curl -s https://api.github.com/repos/ksharindam/chemcanvas/releases/latest \
     | python3 -c "import json,sys; [print(a['name'], a['digest']) for a in json.load(sys.stdin)['assets']]"
   ```
3. Regenerate `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```
4. Build (locally or via Docker) to confirm the package installs correctly
   and the AppImage isn't truncated (compare its size/sha256 to the
   downloaded source) before pushing to the AUR.
