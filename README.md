# libchronoid-archlinux

Arch Linux / AUR packaging for
[libchronoid](https://github.com/semantic-reasoning/libchronoid),
the **stable** variant: builds from tagged release tarballs published
on GitHub Releases. Tracks the `1.0.x` (then `1.1.x`, etc.) series as
they ship.

The sibling [`libchronoid-archlinux-git`](../libchronoid-archlinux-git)
holds the rolling `-git` package that builds from `main` HEAD; the two
co-exist via this PKGBUILD's `conflicts=("libchronoid-git")` declaration.

## Layout

```
PKGBUILD       (build recipe consumed by makepkg / pacman)
.SRCINFO       (machine-readable snapshot of PKGBUILD; AUR requirement)
.gitignore     (ignores makepkg artifacts: pkg/, src/, *.pkg.tar.zst, …)
README.md      (this file)
```

The package is named `libchronoid` per AUR convention for stable
release packages (no `-git` suffix). Currently builds the
[v1.0.0](https://github.com/semantic-reasoning/libchronoid/releases/tag/v1.0.0)
tag — the first stable libchronoid release with the KSUID and UUIDv7
ABI committed at `libchronoid.so.0`.

## Versioning

This package's version mirrors the upstream release tag minus the `v`
prefix: `pkgver=1.0.0` builds the `v1.0.0` tag, `pkgver=1.0.1` builds
`v1.0.1`, and so on. Every `pkgver` bump must be paired with a
recomputed `sha256sums=`, since GitHub's auto-generated source
tarballs are content-addressed by the source commit.

In `pacman -Q`'s `vercmp`, `1.0.0 < 1.0.1 < 1.1.0 < 2.0.0` as
expected, and the rolling `libchronoid-git` package's
`<tag-without-v>.r<N>.g<sha>` versions sort strictly between two
adjacent tags (`1.0.0 < 1.0.0.r5.g8fedc0d < 1.0.1`), so a user
swapping between the stable and `-git` variants doesn't get stuck on
a stale install.

## Local build

From this directory, on an Arch Linux host:

```sh
# Build, test, and install in one shot. Prompts for sudo to run
# pacman -U on the resulting .pkg.tar.zst.
makepkg -si

# Build only, no install. Output is libchronoid-<ver>-<rel>-<arch>.pkg.tar.zst
# in this directory.
makepkg -s

# Skip the check() phase (meson test). Useful when iterating on the
# PKGBUILD itself rather than upstream source.
makepkg -s --nocheck

# Verify the install layout without touching the system pacman db.
makepkg -s --noconfirm
tar -tvf libchronoid-*.pkg.tar.zst | less
```

`makepkg -s` will pull in `meson`, `ninja`, and `gcc` via
`pacman --asdeps` if any are missing.

## Optional: clean-chroot build (matches AUR build farm)

Reproduces what the AUR build farm and `aurutils` users see. Catches
missing `makedepends=` that a developer host has installed globally.

```sh
# One-time chroot setup (requires devtools).
sudo pacman -S devtools
mkdir -p ~/chroots
mkarchroot ~/chroots/libchronoid-build base-devel

# Per-build:
makechrootpkg -c -r ~/chroots -- -s
```

## Test suite

The `check()` phase runs upstream's full `meson test` suite (23 tests
as of 1.0.0: scalar + SIMD parity, parser fuzz vectors, RFC 9562
layout pin, monotonic-sequence invariants, integration test for the
`chronoid-gen` CLI). Failures here block `makepkg`. The suite is
self-contained on POSIX coreutils plus the `chronoid-gen` binary, so
no `checkdepends=` are needed beyond `coreutils` (essential on Arch).

## AUR submission flow

The AUR hosts each package as its own git repo at
`ssh://aur@aur.archlinux.org/<pkgname>.git`. Before the first push:
register an SSH public key on
`https://aur.archlinux.org/account/`.

```sh
# 1. Clone the AUR repo (one-time).
git clone ssh://aur@aur.archlinux.org/libchronoid.git aur-clone

# 2. Sync this repo's PKGBUILD + .SRCINFO into the AUR clone.
cp PKGBUILD .SRCINFO aur-clone/

# 3. Commit and push to AUR.
cd aur-clone
git add PKGBUILD .SRCINFO
git commit -m '<one-line description>'
git push origin master   # AUR's default branch is `master`, not `main`
```

Alternatively, set this repo's `origin` directly to the AUR remote so
`git push` from this directory lands the PKGBUILD on AUR — simpler
when only the maintainer ever touches it. To switch:

```sh
git remote add aur ssh://aur@aur.archlinux.org/libchronoid.git
git push aur main:master
```

## Release flow (per upstream tag)

When upstream tags a new `vX.Y.Z` release on GitHub:

1. **Compute the new sha256.** The simplest:

   ```sh
   curl -fsSL "https://github.com/semantic-reasoning/libchronoid/archive/refs/tags/vX.Y.Z.tar.gz" \
     | sha256sum
   ```

2. **Edit `PKGBUILD`:**

   - `pkgver=X.Y.Z`
   - `pkgrel=1`  (reset; `pkgrel` only bumps for packaging-only changes
     against an unchanged upstream tag)
   - `sha256sums=('<new-hash>')`

3. **Regenerate `.SRCINFO`:**

   ```sh
   makepkg --printsrcinfo > .SRCINFO
   ```

4. **Smoke-test locally** (in a clean chroot is best — see above):

   ```sh
   makepkg -s
   ```

5. **Commit and push** the PKGBUILD + .SRCINFO bump. Push the same
   pair to the AUR remote per the flow above.

PKGBUILD itself only needs structural edits when:

1. Upstream's build system changes (e.g., a new `meson.options` flag
   we want to wire through, a new `makedepends=`).
2. Upstream's install layout changes (e.g., `meson.build` moves a
   header subdir, requires us to update the symlink path under
   `/usr/share/licenses/$pkgname/`).
3. Upstream's license set changes (e.g., a new `LICENSE.*` file is
   added or removed).

## License

`PKGBUILD` itself is contributed under LGPL-3.0-or-later (matching
upstream's primary license). Upstream `libchronoid` is dual-licensed
LGPL-3.0-or-later AND MIT; see the upstream `LICENSE`, `LICENSE.MIT`,
and `NOTICE` files (which the package install routes into both
`/usr/share/doc/libchronoid/` and
`/usr/share/licenses/libchronoid/`).
