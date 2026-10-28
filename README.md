# muster-agent-bin

Arch Linux binary package for [Muster Agent](https://themuster.dev/), an
open-source agentic development environment (ADE) that drives Codex, Claude
Code, OpenCode and local models from one window, with long-term memory,
sandboxes and live diffs.

## Install

```sh
makepkg -si
```

The package repackages upstream's official `.deb`: the Electron tree lands in
`/opt/muster-agent`, `/usr/bin/muster-agent` points at its launcher, and the
desktop entry plus every hicolor icon size are installed as shipped. The MIT
license goes to `/usr/share/licenses/muster-agent-bin/`.

## Naming

`muster-bin` already exists in the AUR, but it is an unrelated project
(giantswarm/muster, an MCP tool proxy). This package is therefore called
`muster-agent-bin` and provides/conflicts `muster-agent` — never `muster`.

## Source URL

Upstream publishes Linux builds on GitHub releases under tags of the form
`agent-v<version>`, as a `.deb`, a `.tar.gz` and an `.AppImage`:

```
https://github.com/musterhq/muster-code/releases/download/agent-v0.3.16/Muster-Agent-0.3.16-linux-amd64.deb
```

All three carry the three checksums published in the release's `SHA256SUMS`
asset (and in the GitHub API's `digest` field), and the one in this PKGBUILD
matches.

### Why the deb and not the AppImage

The AppImage is the obvious choice — `codemeyo-bin` does exactly that — but the
deb is the layout upstream actually maintains for Linux systems:

- `/opt/muster-agent` with `resources/apparmor-profile` and a launcher that
  keeps the Chromium sandbox on wherever it can (see below),
- a desktop entry with the absolute `Exec=/opt/muster-agent/muster-agent`,
- icons in all eight hicolor sizes,
- its `Depends:` field documents the runtime libraries Electron needs, which is
  where this PKGBUILD's `depends=()` comes from.

The `.gz` tarball is the same payload without that metadata. Repackaging the
deb also avoids a runtime dependency on `fuse2` and the squashfs mount; the
price is a ~290 MB installed tree instead of one 113 MB AppImage. The built
package is around 100 MB because zstd compresses better than the AppImage's
squashfs.

## Runtime dependencies

`gtk3`, `nss`, `libxss`, `libxtst`, `alsa-lib`, `libsecret`, `libnotify`,
`at-spi2-core`, `xdg-utils` — the deb's `Depends:`, minus the Debian-renamed
packages (`libgtk-3-0t64`, `libasound2t64`) and with the Arch equivalents.

Optional: `libappindicator-gtk3` (tray icon), `gnome-keyring` or `kwallet`
(credential storage through Electron's `safeStorage`).

## Chromium sandbox

Nothing about the sandbox is patched; the shipped launcher does the work. A
`chrome-sandbox` helper inside a read-only AppImage cannot be setuid, which is
why the AppImage relies on unprivileged user namespaces only. With the deb
layout the setuid bit is possible, so `muster-agent-bin.install` mirrors the
deb's postinst: it leaves the helper at `0755` when `unshare --user true` works
(the Arch default) and makes it `4755` on systems where user namespaces are
restricted — there the setuid helper is the only way to keep renderer
sandboxing. If neither is available, the launcher falls back to `--no-sandbox`
and says so on stderr.

## Patch: MCP launchers

`fix-mcp-launchers.py` patches one expression in
`resources/app.asar` (`dist/runtime/service.cjs`) at package time.

Upstream imports MCP servers from `~/.claude.json`, `~/.codex/config.toml` and
folder `.mcp.json` files, and passes every stdio server with arguments to the
agent as `<dataDir>/mcp-launchers/<id>.sh`. Only the add and update handlers in
Settings write that script, so imported servers start with a missing command:
the chat reports them as failed (`ENOENT`) while Settings › MCP shows them
healthy, because its own test spawns the command directly. Toggling a server
off and on writes its launcher, which hides the bug until the next import.
Present in 0.3.14 to 0.3.16 (`syncDetected()` in
`packages/agent-app/src/runtime/domains/mcp.ts`); reported upstream as
[#766](https://github.com/musterhq/muster-code/issues/766).

The patch makes the config builder write the launcher, synchronously, when it
is missing or stale, using upstream's own script builder. The bundle is
minified, so the site is matched by shape; the script fails the build unless
it matches exactly once, and is idempotent. The patched file is appended to the
archive with a fresh integrity entry, so every other file keeps its bytes.
Drop the patch once #766 is fixed in a release, i.e. once upstream calls
`writeLauncher()` for detected servers.

## Known behaviour

- In-app updates (electron-updater points at this repo's GitHub releases)
  cannot replace the root-owned copy in `/opt`; updates arrive through pacman.
- On Wayland, Electron picks the ozone Wayland backend; if `WAYLAND_DISPLAY`
  is unset or unreachable, Chrome exits instead of falling back to X11. Launch
  it from a real session, or use `muster-agent --ozone-platform=x11`.
- On a machine without a working GPU/DRM node (VMs, headless X servers) the
  window can come up unpainted; `muster-agent --disable-gpu` renders normally.
- Startup performs some network work before the window is shown. Where
  outbound HTTPS silently drops packets (no timeout kicks in) the window may
  never appear; with working — or fast-failing — network it comes up in a few
  seconds.
- The AppArmor profile is shipped but not installed; Arch users who confine the
  app can copy `/opt/muster-agent/resources/apparmor-profile` to
  `/etc/apparmor.d/muster-agent` themselves.

## Updating

1. Check <https://github.com/musterhq/muster-code/releases> for a new
   `agent-v*` tag.
2. Bump `pkgver` (without the `agent-v` prefix); `_deb` and `_url` follow it
   automatically.
3. Refresh `sha256sums` from the release's `SHA256SUMS` asset (the deb's own
   digest) and, because the `LICENSE` is fetched by tag, the license digest.
   The digests are also printed next to every asset on
   `https://github.com/musterhq/muster-code/releases/expanded_assets/agent-v<version>`,
   which is the easier way to read them; `SHA256SUMS` itself only downloads as
   `application/octet-stream`. The `LICENSE` digest only changes when the blob
   at the new tag does — compare `sha` in
   `https://api.github.com/repos/musterhq/muster-code/contents/LICENSE?ref=agent-v<version>`
   against the previous tag before assuming it moved.
4. `makepkg --printsrcinfo > .SRCINFO`, rebuild, then commit and push (see
   *Publishing to the AUR* below); bump `pkgrel` if only the PKGBUILD changed.

## Build directories (`src/`, `pkg/`, `sources/`)

`makepkg` writes to four places, each with its own variable. Only the first of
them is a directory called `sources/`, and only because `SRCDEST` is pointed
there; none of the others is named `sources` by default.

| Path | Variable | Contents |
|---|---|---|
| `sources/` | `SRCDEST` | the untouched upstream files (`Muster-Agent-*.deb`, `LICENSE`), kept for the next build |
| `src/` | `$srcdir` | the extracted tree; `prepare()` runs here |
| `pkg/` | `$pkgdir` | the installation staging tree |
| `*.pkg.tar.zst` | `PKGDEST` | the built package |

`SRCDEST` moves only the downloads, `BUILDDIR` only `src/` + `pkg/`, `PKGDEST`
only the package. A configuration that sets `SRCDEST` alone therefore still
leaves `src/` and `pkg/` next to the `PKGBUILD` — that is the documented
behaviour, not a fallback. `BUILDDIR` also always appends the package name
(`$BUILDDIR/muster-agent-bin/src`), so `sources/src` cannot be produced.

Optionally relocated for the whole system:

```sh
# /etc/makepkg.conf, or ~/.config/pacman/makepkg.conf (which replaces it)
SRCDEST=/var/cache/makepkg/sources
BUILDDIR=/var/cache/makepkg
PKGDEST=/var/cache/makepkg/packages
```

Per build instead, without touching the config. There are no
`--srcdest`/`--builddir`/`--pkgdest` options (`makepkg --help` is the list);
the way in is the environment, because `load_makepkg_config` saves these
variables before sourcing the config and restores them afterwards — so the
environment beats any value in a conf file:

```sh
SRCDEST="$PWD/sources" makepkg                        # downloads land here, symlinked into src/
BUILDDIR=/var/cache/makepkg PKGDEST=/var/cache/makepkg makepkg
```

Preserved that way: `PKGDEST SRCDEST SRCPKGDEST LOGDEST BUILDDIR PKGEXT SRCEXT
GPGKEY PACKAGER CARCH PACKAGECARCH`.

If values set in `makepkg.conf` look ignored, check which file `makepkg` read
and as whom:

- `--config <file>` silences the user config entirely. In
  `/usr/share/makepkg/util/config.sh` the user file is only sourced
  `if [[ $MAKEPKG_CONF = "/etc/makepkg.conf" ]]` — a comparison of the
  *literal strings*, not of the resolved path. Any wrapper that passes
  `--config /etc/makepkg-optimize.conf` (pacman's `makepkg-optimize`) therefore
  never reads `~/.config/pacman/makepkg.conf`. Drop-ins still work there:
  `$MAKEPKG_CONF.d/*.conf` is sourced for whatever config was given.
- A `~/.config/pacman/makepkg.conf` *replaces* `/etc/makepkg.conf` rather than
  layering on it, so a partial user file silently drops the system values.
- `sudo makepkg` reads root's `$HOME`, so the user config is invisible; a
  `devtools`/`paru`/`aurutils` chroot build uses the chroot's stock config.
- A relative path is rejected outright.

`type -a makepkg` and `ls -l ~/.config/pacman/makepkg.conf /etc/makepkg*.conf.d/`
answer most of it. `makepkg` never *moves* files that are already there: with
an `SRCDEST` configured, a source found in `$startdir` still wins over the
cache (`get_filepath()` tests `$startdir` first), so a copy sitting next to the
`PKGBUILD` keeps `SRCDEST` empty until it is moved away.

`.gitignore` lists `src/`, `pkg/`, `sources/` and the upstream assets, so none
of them can be committed to the AUR repo.

## Publishing to the AUR

The package is <https://aur.archlinux.org/packages/muster-agent-bin>. This
folder *is* the AUR clone — `origin` is
`ssh://aur@aur.archlinux.org/muster-agent-bin.git` and `master` tracks it — so
publishing is an ordinary commit and push from here. No separate working copy,
no wrapper script.

```sh
makepkg --printsrcinfo > .SRCINFO          # must equal what makepkg derives
git add PKGBUILD .SRCINFO README.md
git commit -m "upgpkg: muster-agent-bin $(sed -n 's/^pkgver=//p' PKGBUILD)-$(sed -n 's/^pkgrel=//p' PKGBUILD)"
git push origin master
```

Commit message convention: `upgpkg: <pkgname> <pkgver>-<pkgrel>`. The AUR only
accepts commits whose author e-mail is verified on the account, so the identity
must be the one on the `Maintainer:` line
(`gaou-piou <i.am.piou@gmail.com>`) — a global `user.name`/`user.email` that
matches it is enough.

`pkgver` bumps reset `pkgrel` to `1`; a `PKGBUILD`-only change keeps `pkgver`
and increments `pkgrel`.

What must not be committed: the ~100 MB upstream `.deb`, the built
`.pkg.tar.zst`, and `src/` / `pkg/` / `sources/` — that includes
`sources/LICENSE`, which is fetched from the `agent-v<pkgver>` tag just like
the deb. A copy in the repo root would be preferred by `makepkg` over
`$SRCDEST` (it checks `$startdir` first) and so silently shadow the download.
`.gitignore` already covers all of them, so `git status` before pushing is the
only check needed.

Prerequisites: an AUR account with the SSH public key added
(<https://aur.archlinux.org/account>), plus `git` and `openssh`.

A local `pre-commit` hook (`.git/hooks/pre-commit`, so it is never published)
refuses the commit when `.SRCINFO` no longer matches `makepkg --printsrcinfo`;
delete it if it gets in the way.

## Notes

- Upstream is MIT-licensed, x86_64 only on Linux (hence `arch=('x86_64')`).
- `prepare()` extracts `data.tar.xz` out of the deb (an `ar` archive); `cp -a`
  is deliberately avoided for the payload so the Debian uid/gid and modes are
  not fought over on filesystems that reject `chown`.
