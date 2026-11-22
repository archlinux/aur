# tigervnc-runit

Minimal **runit service files for TigerVNC** on **Artix Linux** (including
LARBS/dwm). This packages service glue only; `tigervnc` supplies the actual
server. Version `1.0.0-1` is the initial packaging release.

The service runs `/usr/bin/vncsession -D USER :DISPLAY` as root, which uses
TigerVNC's **foreground** mode for supervision. It creates an **independent**
X11 desktop, *not* a mirror of the locally logged-in dwm display.

## Files installed

- `/etc/runit/sv/tigervnc/run` — runit foreground service
- `/etc/runit/sv/tigervnc/log/run` — svlogd logger
- `/etc/conf.d/tigervnc-runit` — editable username/display config (pacman backup)
- `/usr/share/doc/tigervnc-runit/dwm-vnc.desktop` — opt-in dwm session example
- `/usr/share/doc/tigervnc-runit/README.md` — these instructions

The package **does not** enable/start a service or edit a user's home folder.

## Build and install on Artix runit

From the directory containing `PKGBUILD`:

```sh
makepkg -si
```

The Artix repositories must provide `tigervnc` and `runit`. `makepkg` comes
from `pacman` / `base-devel` tooling.

## Configure for LARBS/dwm

1. Install/use your dwm executable (it must be discoverable as `dwm` in the
   session's PATH). If no suitable desktop entry already exists, install the
   example:

   ```sh
   sudo install -Dm644 /usr/share/doc/tigervnc-runit/dwm-vnc.desktop \
       /usr/share/xsessions/dwm-vnc.desktop
   ```

2. As the **normal user** who will own the VNC session, create the VNC password
   and configuration:

   ```sh
   mkdir -p ~/.config/tigervnc
   vncpasswd
   cat > ~/.config/tigervnc/config <<'VNC_CONFIG'
   session=dwm-vnc
   geometry=1920x1080
   depth=24
   localhost
   securitytypes=vncauth
   VNC_CONFIG
   ```

   `localhost` only binds VNC locally. `vncauth` alone is not encrypted;
   use an SSH tunnel or a secure VPN. Keep the password file private.

3. As root, edit `/etc/conf.d/tigervnc-runit` and set a **real** username:

   ```sh
   VNC_USER="alice"
   VNC_DISPLAY=":1"
   ```

4. Enable the service only **after** completing the configuration:

   ```sh
   sudo ln -s /etc/runit/sv/tigervnc /run/runit/service/tigervnc
   sudo sv status tigervnc
   ```

   To restart after a change: `sudo sv restart tigervnc`.
   To disable: `sudo sv down tigervnc`, then remove the symlink.

5. On another computer, create an SSH tunnel:

   ```sh
   ssh -N -L 5901:127.0.0.1:5901 alice@ARTIX_HOST
   ```

   In a second client terminal:

   ```sh
   vncviewer 127.0.0.1::5901
   ```

## Logs and troubleshooting

- runit status: `sudo sv status tigervnc`
- runit output: `sudo tail -f /var/log/tigervnc/current`
- TigerVNC session output: `~/.local/state/tigervnc/*.log` (under `VNC_USER`)
- Confirm the graphical session is listed as `dwm-vnc` in
  `/usr/share/xsessions/` and that `dwm` can be started by the account.
- `vncsession` uses PAM; your Artix system must have a working PAM/session
  configuration. If the login or display exits immediately, inspect the logs.
- TigerVNC may conflict with an existing graphical login of the **same user**.
  For sharing the *existing* dwm display use `x0vncserver` instead.
- LARBS `~/.xinitrc` / `~/.config/x11/xprofile` is not automatically invoked by
  a `session=dwm-vnc` desktop entry. Add only the startup commands you need.

## AUR publishing

This directory is **AUR Git repository content**, not an uploaded binary.
Before publishing, update the `# Maintainer:` line and verify that the package
name does not already exist in the AUR or Artix repositories.

```sh
bash -n tigervnc.run tigervnc.log.run PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -si
namcap PKGBUILD  # optional; needs namcap installed
```

To publish, clone/create your `tigervnc-runit` AUR Git repository, copy all
package files into it (including `.SRCINFO`), then `git add`, commit, and
`git push`. The AUR accepts package metadata/source files via **Git**, not a
binary `.pkg.tar.zst` or this convenience `.tar.gz` download.

The bundled service glue is 0BSD licensed. TigerVNC itself has its own license.
