# aur-plug

AUR package definition for [`plug`](https://github.com/offa/plug), the Linux
control software for the Fender Mustang series of guitar amplifiers.

This repo is the source for the [`plug` AUR
package](https://aur.archlinux.org/packages/plug) — it doesn't contain the
application itself, just the recipe (`PKGBUILD`) that downloads, builds, and
packages it for Arch Linux.

## Layout

- `PKGBUILD` — the package build recipe: version, dependencies, and the
  `prepare()` / `build()` / `check()` / `package()` steps run by `makepkg`.
- `.SRCINFO` — generated metadata read by the AUR and AUR helpers (`yay`,
  `paru`, ...). Must stay in sync with `PKGBUILD`.
- `Dockerfile` / `.dockerignore` — builds the package in a disposable Arch
  Linux container, for testing changes without touching the host system.
- `pkg/`, `src/` — local build output from running `makepkg` directly
  (untracked, safe to delete).

## Building locally (Arch Linux)

```bash
makepkg -si
```

This downloads the upstream source tarball, verifies its checksum, builds
with CMake, runs the unit tests, and installs the result. Requires the
`makedepends`/`checkdepends` in `PKGBUILD` (`cmake`, `gtest`) plus the runtime
`depends` (`qt6-base`, `libusb`).

## Building in Docker (no Arch host needed)

```bash
docker build -t plug-builder .
mkdir -p dist
docker run --rm -v "$PWD/dist:/output" plug-builder
```

The resulting `plug-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst` (and a
`plug-debug-...` package) land in `./dist`. Useful for validating a version
bump or dependency change before publishing.

> [!NOTE]
> `mkdir -p dist` first. The container builds as non-root (UID 1000) and
> copies the packages into the mounted `/output` at the end; if `./dist`
> doesn't already exist, Docker creates it owned by `root` and the copy
> fails with `Permission denied`. If your host user isn't UID 1000, run with
> `--user "$(id -u):$(id -g)"` instead.

## Bumping the package version

1. Update `pkgver` (and reset `pkgrel=1`) in `PKGBUILD`.
2. Update the `sha256sums` entry to match the new upstream tarball — e.g.
   `curl -sL <source-url> | sha256sum`.
3. Check upstream's `CMakeLists.txt`/`README.md` for dependency changes
   (this package moved from `qt5-base` to `qt6-base` between 1.4.5 and
   1.5.0 with no PKGBUILD-visible warning — it just failed to configure).
4. Regenerate `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```
5. Build (locally or via Docker) to confirm it still compiles and the unit
   tests pass before pushing to the AUR.
