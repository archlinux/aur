# liveside (Arch Linux PKGBUILD)

Arch Linux `PKGBUILD` that builds **Liveside**, a Twitch chat client for
viewers, moderators and broadcasters, with a GTK 4 window, a terminal
frontend and a daemon
([foxkyong/liveside](https://github.com/foxkyong/liveside),
[liveside.jifox.net](https://liveside.jifox.net)).

This is the package published in the AUR as
[`liveside`](https://aur.archlinux.org/packages/liveside), kept by
Liveside's own author. The same repository is pushed to both places.

## What you get

- `liveside-gui` — the window
- `liveside-tui` — the terminal frontend, which also works over SSH
- `liveside-daemon` — keeps the chat running without a frontend, with a
  systemd user service (`systemctl --user enable --now liveside-daemon.service`;
  log in once from a frontend first)
- the launcher entry, the icon and the AppStream metainfo
- the example bot in `/usr/share/liveside/examples/bots/`
- the user documentation in `/usr/share/doc/liveside/`

Built from the release tarball on GitHub with `cargo --frozen`, so only the
crates pinned in upstream's `Cargo.lock` are used.

## Building & installing

From the AUR, with any AUR helper:

```bash
yay -S liveside
```

Or from this repository:

```bash
git clone https://github.com/foxkyong/aur-liveside.git
cd aur-liveside
makepkg -si
```

`cargo` is the only build dependency. `check()` runs the whole upstream
test suite; `makepkg --nocheck` skips it.

LTO is switched off (`options=('!lto')`): makepkg's LTO turns the C code of
`aws-lc` into GCC bitcode, which the linker Rust uses cannot read, and the
build then fails with every `aws_lc` symbol undefined.

## Updating to a new version

Upstream tags every release on GitHub as `v<version>`. To bump:

1. Set `pkgver` to the new version and `pkgrel=1`.
2. Regenerate the checksum: `updpkgsums` (from `pacman-contrib`).
3. Regenerate metadata: `makepkg --printsrcinfo > .SRCINFO`.
4. Verify it builds and passes `namcap PKGBUILD *.pkg.tar.zst`: `makepkg -f`.
5. Commit, then push to both remotes:

   ```bash
   git push github main
   git push aur main:master
   ```

The AUR only accepts the `master` branch.

## License

Liveside is licensed under **GPL-3.0-or-later** (see `LICENSE` in the
upstream repository). This repository contains only the packaging recipe;
the source code is downloaded from GitHub during the build.
