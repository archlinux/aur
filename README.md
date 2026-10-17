# kosmozoo-git

AUR package for [kosmozoo](https://github.com/alexindigo/kosmozoo) —
local review and curation app for ComfyUI image output, tracking git `main`.
The Deno engine and Solid client run from source on Arch's `deno` and `sqlite`;
this package is not the official compiled executable.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).
- `kosmozoo.sh` — `/usr/bin/kosmozoo` launcher for the cached Deno application.

## What gets installed

| # | Path | Purpose |
|---|---|---|
| 1 | `/usr/lib/kosmozoo/` | application source, built client, plugins and cached Deno dependencies |
| 2 | `/usr/bin/kosmozoo` | launcher (state defaults to `$XDG_STATE_HOME/kosmozoo` or `~/.local/state/kosmozoo`) |
| 3 | `/usr/lib/systemd/user/kosmozoo-engine.service` | optional engine autostart |
| 4 | `/usr/share/applications/kosmozoo.desktop` | desktop launcher |
| 5 | `/usr/share/icons/hicolor/256x256/apps/kosmozoo.png` | application icon |

Run `kosmozoo serve`, then open http://127.0.0.1:2084 and point it at your ComfyUI host(s)
(☰ menu, or `KOZMOZOO_HOSTS`).

For optional autostart, use `systemctl --user enable --now kosmozoo-engine.service`.

## Dependencies

- **Runtime**: `deno`, `sqlite`, `hicolor-icon-theme`
- **Build**: `git`

## Building

```
makepkg -si
```

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that regenerates
`.SRCINFO` and runs `namcap PKGBUILD` whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```
cp pre-commit.sh .git/hooks/pre-commit
```

### Bump pkgrel

Bump `pkgrel` in PKGBUILD when the PKGBUILD itself changes (but
upstream hasn't released a new version). Re-run `.SRCINFO` generation
after. The version itself tracks git via `pkgver()` — no action needed
for upstream commits.

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
