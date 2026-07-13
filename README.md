# jami-qt-git

AUR package for [Jami](https://jami.net) — the Qt desktop client (`jami-qt`)
built from upstream git tip
([git.jami.net/savoirfairelinux/jami-client-qt](https://git.jami.net/savoirfairelinux/jami-client-qt))
with three patches applied.

## Why this package exists

Arch's `extra/jami-qt` package (version `20260707.0-1` at time of writing) has
a QML property-name bug that breaks the main-window sidebar and several
settings dialogs on Qt 6.10+ (which Arch has been shipping since 2026-Q2).
Upstream migrated to Qt's native `SortFilterProxyModel` (which requires
Qt 6.10) but missed renaming `invert:` → `inverted:` in five places. The
result: `Cannot assign to non-existent property "invert"` at
`AccountComboBox.qml:101` cascades into `SidePanel.qml` failing to load,
and the account switcher (plus several settings pages) don't render.

This package builds jami-qt from upstream git tip and applies three patches:

- **`zxing-cpp-3.patch`** (borrowed from Arch's official PKGBUILD): fixes
  build against system zxing-cpp 3.x (upstream includes headers with
  unqualified paths; zxing-cpp 3 ships headers under `ZXing/`).
- **`fix-link.patch`** (borrowed from Arch's official PKGBUILD): explicitly
  links `libavutil` on the `jami` target — with binutils `--as-needed`, the
  transitive dependency via `libjami` isn't pulled in unless named.
- **`fix-valuefilter-invert.patch`** (this package's own fix): renames
  `invert:` → `inverted:` in five ValueFilter blocks
  (AccountComboBox.qml, LinkedDevicesBase.qml, VideoSettingsPage.qml x3).

The `-git` suffix follows Arch VCS-package convention: `pkgver()` is dynamic
and each `makepkg` picks up the latest upstream commit, so you'll get
upstream fixes automatically as they're merged.

## Relationship to `extra/jami-qt`

This package `provides`/`conflicts`/`replaces` `jami-qt`, so installing it
removes the official Arch package. If upstream Jami fixes the `invert:` typo
and Arch rebuilds, you can `pacman -Rns jami-qt-git && pacman -S jami-qt` to
switch back at any time.

## Dependencies

- **Runtime**: `jami-daemon`, `glib2`, `gdk-pixbuf2`, `libnm`, `libnotify`,
  `qt6-declarative`, `qt6-multimedia`, `qt6-svg`, `qt6-5compat`,
  `qt6-webengine`, `qt6-httpserver`, `qt6-webchannel`, `qt6-shadertools`,
  `hunspell`, `tidy`, `md4c`, `qwindowkit`, `zxing-cpp`
- **Build**: `cmake`, `git`, `python`, `qt6-tools`, `qt6-networkauth`

## Building

```
git clone https://aur.archlinux.org/jami-qt-git.git
cd jami-qt-git
makepkg -si
```

Full build takes 30–45 minutes on a modern laptop; jami-client-qt is a
large Qt6 C++ project (~1200 objects) with WebEngine as a dependency.

## Maintenance

If you build this locally and want to prevent `pacman -Syu` from replacing
it with the (still broken) `extra/jami-qt`, add to `/etc/pacman.conf`:

```
IgnorePkg = jami-qt
```

When upstream jami-client-qt fixes the `invert:` typo, this package's third
patch will fail to apply — that's the signal to drop the patch (or the
whole package, and switch back to `extra/jami-qt` if Arch has also
rebuilt).

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that automates this — it
regenerates `.SRCINFO` and stages it whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```
cp pre-commit.sh .git/hooks/pre-commit
```

Or manually:

```
makepkg --printsrcinfo > .SRCINFO
```

### Bump pkgrel

Bump `pkgrel` in PKGBUILD when the PKGBUILD itself changes (but upstream
hasn't released a new version). Re-run `.SRCINFO` generation after.

## Contents

- `PKGBUILD` — Arch Linux package build script
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD)
- `zxing-cpp-3.patch`, `fix-link.patch` — borrowed from Arch's official
  jami-qt packaging (attribution in patch headers)
- `fix-valuefilter-invert.patch` — this package's own fix for the QML
  property typo
- `pre-commit.sh` — git hook that regenerates .SRCINFO on commit
- `README.md`, `REUSE.toml` — documentation and licensing metadata

## License

Packaging files (PKGBUILD, patches, README, hooks): 0BSD.
Jami itself: GPL-3.0-or-later.
