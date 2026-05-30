# ruroco - AUR split package

PKGBUILD for [ruroco](https://github.com/beac0n/ruroco) (Run Remote Command).

A single `pkgbase=ruroco` produces three packages from one source build:

| Package             | Binary(ies)                          | Purpose                          |
|---------------------|--------------------------------------|----------------------------------|
| `ruroco-client`     | `ruroco-client`                      | CLI - sends the UDP packets      |
| `ruroco-client-ui`  | `ruroco-client-ui`                   | egui GUI front-end               |
| `ruroco-server`     | `ruroco-server`, `ruroco-commander`  | server + commander + systemd     |

OpenSSL is linked dynamically against the system package (the upstream
`release-build` feature, which vendors OpenSSL, is intentionally not used).

## Building / testing locally

```bash
updpkgsums          # fill in the real sha256sums (currently SKIP)
makepkg -si         # build + install
namcap PKGBUILD     # lint the PKGBUILD
namcap *.pkg.tar.zst
```

## ruroco-server notes

- A `ruroco` system user/group is created via `/usr/lib/sysusers.d/ruroco.conf`.
- Example config is installed to `/etc/ruroco/config.toml` (a pacman `backup`
  entry, so local edits survive upgrades).
- systemd units are installed to `/usr/lib/systemd/system/` with `ExecStart`
  rewritten from `/usr/local/bin` to `/usr/bin`.

## Publishing to the AUR

This repo is meant to be pushed to `ssh://aur@aur.archlinux.org/ruroco.git`.
Before pushing:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO   # regenerate on every version bump
git add PKGBUILD .SRCINFO ruroco.sysusers ruroco-server.install
git commit -m "ruroco 0.14.1-1"
git push
```

> `.SRCINFO` is mandatory and must be regenerated whenever the PKGBUILD changes.
