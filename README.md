# gitpulsar

Arch Linux package for [Gitpulsar](https://gitlab.com/ilshat-apps/gitpulsar),
a native Git client for GNOME written in Rust with GTK4 and libadwaita.

Built **from source** (tag `v<pkgver>`) and linked against the system
libraries.

```sh
SRCDEST="$PWD/sources" makepkg -si
```

## Why not `gitpulsar-appimage`

The AUR `gitpulsar-appimage` (1.1.0-1) is three releases behind and ships an
AppImage that bundles its own GTK/libadwaita, so it ignores system updates and
theming fixes. Upstream already builds as a small native binary (~1.4 MiB
package). The two conflict, so installing this one removes the AppImage.

## What this package does

| | |
|---|---|
| Source | GitLab tag tarball + `system-libgit2.patch` |
| Binary | `/usr/bin/gitpulsar-gtk`, plus a `gitpulsar` symlink |
| Data | desktop entry, AppStream metainfo, app icon, symbolic action icons (hicolor) |
| Tests | `cargo test -p gitpulsar-core` (the GTK crate needs a display) |

## Non-obvious points

- **`system-libgit2.patch`**: upstream pins `git2 = "0.19"`, which accepts
  only libgit2 1.8.x. With Arch's libgit2 1.9, `libgit2-sys` falls back to its
  bundled copy. Built with makepkg's `lto` option, that copy holds GCC LTO
  objects that `rust-lld` cannot link (`undefined symbol: git_*`). The patch
  bumps to git2 0.20 (libgit2 1.9); the code compiles unchanged. Drop the patch
  once upstream bumps git2.
- `LIBSSH2_SYS_USE_PKG_CONFIG=1` matters for the same LTO reason: the `ssh`
  feature of git2 pulls in `libssh2-sys`, which otherwise builds its bundled
  copy too.
- `RUSTONIG_SYSTEM_LIBONIG=1` links syntect's regex engine to system
  `oniguruma`.
- `git` is a runtime dependency: fetch, pull, push, bisect, archive and patch
  operations call the `git` CLI.
