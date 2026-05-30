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

## Publishing / releasing (`Makefile`)

This repo is pushed to `ssh://aur@aur.archlinux.org/ruroco.git`. A `Makefile`
wraps the maintenance loop - run `make help` for the full list:

```bash
make release VERSION=0.14.2   # bump pkgver + reset pkgrel, updpkgsums,
                              # regenerate .SRCINFO, sanity build, commit
make push                     # review the commit, then push to the AUR

make keywords                 # set AUR search keywords (one-off)
```

> `.SRCINFO` is mandatory and must match the PKGBUILD on every push - the
> `release`/`srcinfo` targets regenerate it for you.
