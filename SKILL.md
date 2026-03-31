---
name: aur-pkgbuild

description: AUR PKGBUILD creation and guidelines following Arch Wiki standards

license: MIT

metadata:
  version: 1.0.0
  author: Youcef
  tags: [arch-linux, aur, pkgbuild, packaging, makepkg]
---

# AUR PKGBUILD Creation & Guidelines

## Overview
A `PKGBUILD` is a Bash script used by Arch Linux's `makepkg` utility to build packages. It contains metadata, dependencies, sources, and build instructions.

## Mandatory Variables
- **`pkgname`**: Package name (lowercase alphanumerics, `@._+-` allowed). Cannot start with `-` or `.`.
- **`pkgver`**: Version (no hyphens `-` allowed; use `_` instead).
- **`pkgrel`**: Release number (reset to `1` on new `pkgver`).
- **`arch`**: Architectures (e.g., `('x86_64')` or `('any')`).

## Metadata Variables
- **`pkgdesc`**: Concise description (≤80 chars, no self-referencing names).
- **`url`**: Official upstream site.
- **`license`**: SPDX identifier (e.g., `'MIT'`, `'GPL-3.0-or-later'`).
- **`groups`**: Package group (optional).

## Dependencies
- **`depends`**: Runtime and build-time dependencies.
- **`makedepends`**: Build-only dependencies. **Do not** include `base-devel` members.
- **`checkdepends`**: Test suite dependencies (only if `check()` is present).
- **`optdepends`**: Optional features. Format: `'package: description'`.

## Package Relations
- **`provides`**: Virtual packages or libraries provided. Include version if relevant.
- **`conflicts`**: Packages that cannot coexist.
- **`replaces`**: Obsolete packages this one replaces.
- **`backup`**: Config files to preserve during upgrades (relative paths, e.g., `etc/foo.conf`).

## Build Functions
Functions are executed in order:
1. **`pkgver()`**: (VCS only) Auto-generates version.
2. **`prepare()`**: Unpacks/patches sources.
3. **`build()`**: Compiles software.
4. **`check()`**: Runs test suite.
5. **`package()`**: Installs files into `$pkgdir`.

## Sources & Integrity
- **`source`**: Array of URLs or local files. Use unique names for VCS sources: `("${pkgname}::git+https://...")`.
- **Checksums**: Always use the strongest available (`sha256sums`, `sha512sums`). Use `SKIP` for VCS sources.
- **`validpgpkeys`**: PGP fingerprints for signature verification.

## VCS Package Guidelines (`-git`, `-svn`, etc.)
- `pkgname` should end with `-git`.
- Use `pkgver()` to generate version: `printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"`.
- `source` should use `git+https://...` or `git+file://...`.
- Add `git` to `makedepends`.
- Use `#branch=main` or `#tag=v1.0` in source URL if needed.

## Best Practices & Validation
- **Order**: Maintain standard variable order (Name → Version → Generic → Deps → Relations → Sources → Functions).
- **Validation**: 
  - Run `namcap PKGBUILD` to check for packaging errors.
  - Run `shellcheck --shell=bash PKGBUILD` for script errors.
- **Quoting**: Quote variables properly to prevent word splitting.
- **Chroot**: Remember `package()` runs in a chroot; only files in `$srcdir` or downloaded sources are available.
- **Epoch**: Use `epoch` only when versioning scheme changes break comparison logic.

## Example Structure
```bash
# Maintainer: Your Name <your.email@example.com>
pkgname='example-git'
pkgver=r0.0.0
pkgrel=1
pkgdesc='Description of the software'
arch=('x86_64')
url='https://example.com'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('example')
conflicts=('example')
source=("git+https://github.com/user/example.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
```
