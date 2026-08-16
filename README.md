# 1password-secret-service-git

AUR package for [1password-secret-service](https://github.com/alexindigo/1password-secret-service) — a Freedesktop Secret Service (org.freedesktop.secrets) provider backed by 1Password.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `1password` (desktop app), `sqlite`, `glibc`
- **Build**: `go`, `git`

The `1password` dependency refers to the stable desktop app. If you use `1password-beta`, install `1password-secret-service-beta-git` instead.

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
after.

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
