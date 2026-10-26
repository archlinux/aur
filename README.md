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
https://github.com/musterhq/muster-code/releases/download/agent-v0.3.13/Muster-Agent-0.3.13-linux-amd64.deb
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
price is a ~290 MB installed tree instead of one 117 MB AppImage. The built
package is ~102 MB because zstd compresses better than the AppImage's squashfs.

## Runtime dependencies

`gtk3`, `nss`, `libxss`, `libxtst`, `alsa-lib`, `libsecret`, `libnotify`,
`at-spi2-core`, `xdg-utils` — the deb's `Depends:`, minus the Debian-renamed
packages (`libgtk-3-0t64`, `libasound2t64`) and with the Arch equivalents.

Optional: `libappindicator-gtk3` (tray icon), `gnome-keyring` or `kwallet`
(credential storage through Electron's `safeStorage`).

## Chromium sandbox

Nothing is patched into the binary; the shipped launcher does the work. A
`chrome-sandbox` helper inside a read-only AppImage cannot be setuid, which is
why the AppImage relies on unprivileged user namespaces only. With the deb
layout the setuid bit is possible, so `muster-agent-bin.install` mirrors the
deb's postinst: it leaves the helper at `0755` when `unshare --user true` works
(the Arch default) and makes it `4755` on systems where user namespaces are
restricted — there the setuid helper is the only way to keep renderer
sandboxing. If neither is available, the launcher falls back to `--no-sandbox`
and says so on stderr.

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
4. `makepkg --printsrcinfo > .SRCINFO`, rebuild, commit, and bump `pkgrel` if
   only the PKGBUILD changed.

## Notes

- Upstream is MIT-licensed, x86_64 only on Linux (hence `arch=('x86_64')`).
- `prepare()` extracts `data.tar.xz` out of the deb (an `ar` archive); `cp -a`
  is deliberately avoided for the payload so the Debian uid/gid and modes are
  not fought over on filesystems that reject `chown`.
