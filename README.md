# AUR package: rikkahub-pc

Arch Linux packaging for **Rikkahub** — the native (Tauri) desktop LLM chat client.
This is a **source build**: it compiles the Rust/Tauri shell and the Bun-compiled
backend sidecar from the tagged GitHub release.

## Files

| File | Purpose |
|---|---|
| `PKGBUILD` | Build recipe (source tarball + patch + launcher + desktop entry) |
| `.SRCINFO` | Machine-readable metadata (regenerate with `makepkg --printsrcinfo` after edits) |
| `resolve-data-dir.patch` | Redirects the default data dir from `/opt/.../pc-data` to `$XDG_DATA_HOME/rikkahub-pc` |
| `rikkahub-pc.sh` | `/usr/bin/rikkahub-pc` launcher → execs `/opt/rikkahub-pc/rikkahub` |
| `rikkahub-pc.desktop` | Desktop entry (installed to `/usr/share/applications`) |
| `rikkahub-pc.install` | post_install/post_upgrade notes |

## Layout produced at runtime

```
/opt/rikkahub-pc/
├── rikkahub          # Tauri (Rust) shell — the native window
├── rikkahub-server   # Bun-compiled backend sidecar (spawned by the shell)
├── web-ui/build/client/  # frontend, served by the sidecar
├── fonts/            # bundled fonts
└── icons/            # provider/search-service logos
```

User data lives in `~/.local/share/rikkahub-pc` (or `$XDG_DATA_HOME/rikkahub-pc`).

## Build & install

```bash
cd packaging/aur
makepkg -si            # build and install (needs base-devel, bun, cargo, webkit2gtk-4.1)
```

After bumping `pkgver` (or editing any field), regenerate `.SRCINFO`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

## Notes

- **In-app updates are not used** for this package. The updater can't write to the
  root-owned `/opt` and would offer the wrong (bare-server) artifact anyway — update
  via `pacman -Syu` and ignore the in-app prompt.
- The `resolve-data-dir.patch` only changes the *fallback* data-dir default, so the
  in-app "move data folder" setting still works.
- `tauri build --no-bundle` is used because the configured NSIS bundle target is
  Windows-only; the Linux file layout is assembled manually in `package()`.
- Keep the `sha256sums` in sync with the GitHub source tarball + the three local
  files when bumping versions.
