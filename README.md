# bcont-aur

AUR packaging for [bcont](https://github.com/bencejuhaasz/bcont) — a bubblewrap
sandbox with Wayland security-context for Sway. This repo mirrors the
[`bcont-git`](https://aur.archlinux.org/packages/bcont-git) AUR package.

## Install

```bash
git clone https://aur.archlinux.org/bcont-git.git
cd bcont-git
makepkg -si
```

Or with an AUR helper: `paru -S bcont-git`

## Maintaining

The AUR is a separate git remote (the `master` branch is what the AUR serves):

```bash
git remote add aur ssh://aur@aur.archlinux.org/bcont-git.git
```

After changing `PKGBUILD`, regenerate `.SRCINFO` and push to both remotes:

```bash
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "..."
git push origin main
git push aur main:master
```

`pkgver` is derived from git automatically (`pkgver()` in the PKGBUILD), so
there is no need to bump it for upstream commits — users get the latest via
`makepkg`. Bump `pkgrel`/refresh `.SRCINFO` only when the packaging itself
changes.
