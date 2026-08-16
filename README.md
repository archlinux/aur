# kosmozoo-git

AUR package for [kosmozoo](https://github.com/alexindigo/kosmozoo) —
local ComfyUI image review/curation tool (zero-build SPA + Python stdlib
server), tracking git `main`.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).
- `kosmozoo` — `/usr/bin` launcher (`python3 /usr/lib/kosmozoo/server.py`).
- `kosmozoo.service` — systemd **user** unit (`systemctl --user enable --now kosmozoo`).

## What gets installed

| Path | Purpose |
|---|---|
| `/usr/lib/kosmozoo/` | server.py, index.html, face-detection scripts, logos |
| `/usr/bin/kosmozoo` | launcher (state auto-lives in `~/.local/state/kosmozoo`) |
| `/usr/lib/systemd/user/kosmozoo.service` | optional autostart |

Then open http://127.0.0.1:2084 and point it at your ComfyUI host(s)
(☰ menu, or `KOZMOZOO_HOSTS`).

Face detection is optional: run
`KOZMOZOO_VENV=~/.local/share/kosmozoo/venv /usr/lib/kosmozoo/setup_facedetect.sh`
once, then start the server with the same `KOZMOZOO_VENV`.

## Dependencies

- **Runtime**: `python`
- **Build**: `git`
- **Optional**: `python-pytorch` (local anime face detection)

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
