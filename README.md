# pipedal-bin — AUR maintainer notes

**This document is written by the package maintainer. It is NOT upstream
PiPedal documentation.** The software is PiPedal by Robin E. R. Davies;
upstream documentation lives at <https://rerdavies.github.io/pipedal/>.

This package repacks the upstream
[`pipedal_2.0.110_amd64.deb`](https://github.com/rerdavies/pipedal/releases)
into an Arch package. No compilation is involved.

## Packaging decisions

- **Inert by design**: installing the package copies files and prints
  information. It does not start services, enable anything, or modify
  the boot configuration.
- **Plugin set ships as `toobamp-bin`**: the LV2 bundle is a hard
  dependency on the released [`toobamp-bin`](https://aur.archlinux.org/packages/toobamp-bin)
  package (the standard ToobAmp release). Upstream's .deb embeds an
  unpublished newer snapshot (1.3.85) that cannot be repacked; the
  released set is functionally identical for the great majority of
  plugins, minus unreleased additions (e.g. ToobWarmer, ToobMultiEcho).
- **High-port default**: the shipped config sets
  `"socketServerAddress": "0.0.0.0:8080"` (upstream's default is port
  80, which requires root or authbind). Users can override in
  `/var/pipedal/config/config.json` or via `pipedalconfig --install
  --port <n>`.
- **`jack` is required**: the virtual `jack` is provided by both
  `jack2` and `pipewire-jack`; pacman resolves the dependency against
  whichever is installed and prompts to pick one if neither is.
- **`authbind` is optdepends**: only needed if the web UI serves on a
  port below 1024.
- **`/usr/sbin` merged**: upstream ships admin binaries in `/usr/sbin`;
  Arch's usrmerge has `/usr/sbin` as a symlink, so they are installed to
  `/usr/bin` (same location at runtime).

## Upstream installer warning

The upstream postinst (`pipedalconfig --install`, run automatically by
the .deb) assumes a **dedicated PiPedal machine**. On a general-purpose
desktop it will, among other things:

- enable and start the `pipedald` / `pipedaladmind` systemd services
- create the `pipedal_d` user and `/var/pipedal`
- add realtime limits (`rtprio 95`, memlock)
- attempt Wi-Fi hotspot / P2P service setup when NetworkManager is
  present

It does not modify the boot configuration. Kernel real-time tuning
(`preempt=voluntary` on the kernel command line) is handled by the
separate interactive `pipedal_kconfig` tool, which nothing in this
package ever runs.

This package intentionally does not run the installer. If the machine
is dedicated to PiPedal, run `sudo pipedalconfig --install --port 8080`
as root.

## License

Expat (MIT) for PiPedal itself; bundled LV2 plugins and assets carry
their own licenses (BSD, Apache-2.0, MPL-2.0, GPL-2.1+). See
`/usr/share/doc/pipedal/copyright` after installation.
