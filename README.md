# qt6-configqml

AUR package for [configqml](https://github.com/alexindigo/configqml), layered configuration for Qt and QML.

## Contents

`PKGBUILD` builds the release archive; `.SRCINFO` contains the generated AUR metadata.
The packaging files are licensed under 0BSD; configqml is LGPL-3.0-or-later.

## Dependencies

Runtime dependencies: qt6-base=6.12.0, qt6-declarative=6.12.0, libgcc, libstdc++, glibc.
Build dependencies: cmake, ninja, and the standard Arch base-devel tools.

## Maintenance

The Qt dependencies are pinned to 6.12.0 because configqml's QML metadata adapter
uses private QtCore API. Rebuild and reverify the private adapter gate before
changing the supported Qt version.
Install the supplied hook on a fresh clone with `install -m755 pre-commit.sh .git/hooks/pre-commit`.
When PKGBUILD is staged, the hook regenerates `.SRCINFO` using makepkg.
Run packaging tools only inside the authorized build VM.

## Release source

The package builds the published v0.2.1 GitHub tag archive and verifies its
SHA-256 checksum. The packaging recipe follows the v0.2.1 tag, including its
exact Qt 6.12.0 dependency pins.
