# tigervnc-runit — two runit services for TigerVNC

**Version 1.1.0-2.** AUR-ready packaging for Artix Linux + runit, including
LARBS/dwm. This package installs runit service definitions, not TigerVNC itself
(which is provided by the `tigervnc` dependency). No services are enabled
or started during installation. Configure one or both services to your needs.

| Service | TigerVNC command | Desktop | Default port |
|---|---|---|---|
| `tigervnc` | `vncsession -D` | Independent virtual X11 session | 5901 (`:1`) |
| `tigervnc-share` | `x0vncserver` | Your currently running X11 session | 5900 |

These services can be managed independently. Running both is possible in
principle, but **TigerVNC's virtual session may reject a second graphical
login for the same Linux user**. For an existing logged-in LARBS/dwm desktop,
use `tigervnc-share`. For a separate/headless desktop, use `tigervnc` with a
user that is not already logged into a graphical session if necessary.

## Install and configure

Build locally, in this directory, with `makepkg -si`. Then set a real non-root
username in `/etc/conf.d/tigervnc-runit`:

```sh
VNC_USER="alice"
VNC_DISPLAY=":1"
SHARE_DISPLAY=":0"
SHARE_PORT="5900"
SHARE_XAUTHORITY=""
SHARE_PASSWORD_FILE=""
```

As `alice`, create a VNC password (`vncpasswd` writes
`~/.config/tigervnc/passwd` by default):

```sh
mkdir -p ~/.config/tigervnc
vncpasswd
chmod 600 ~/.config/tigervnc/passwd
```

The file `/etc/conf.d/tigervnc-runit` is installed as a pacman backup file,
so custom settings survive upgrades. Treat it as a privileged shell fragment.

### Mode A: independent virtual X11 / dwm

1. If you do not already have `/usr/share/xsessions/dwm-vnc.desktop`, install
   the optional example provided by this package:

   ```sh
   sudo install -Dm644 /usr/share/doc/tigervnc-runit/dwm-vnc.desktop \
       /usr/share/xsessions/dwm-vnc.desktop
   ```

2. As your **normal** user, create `~/.config/tigervnc/config`:

   ```ini
   session=dwm-vnc
   geometry=1920x1080
   depth=24
   rendernode=
   localhost
   securitytypes=vncauth
   ```

   `localhost` is important: VncAuth alone is **not encrypted**.
   `rendernode=` must have an empty value, without quotes. This disables
   Xvnc's DRI3 GPU acceleration so the virtual server does not auto-select
   a GPU and interfere with local Xorg startup. The virtual run script
   refuses to launch without this setting in the effective configuration
   (system defaults, user config, then system mandatory overrides).
   Software rendering is used instead. The service clears inherited
   `XDG_CONFIG_HOME` and uses `~/.config/tigervnc/config` (or the legacy
   `~/.vnc/config` when that directory is still in use).
   In the config file, these are TigerVNC options, **not** shell assignments.

3. Enable only this runit service:

   ```sh
   sudo ln -s /etc/runit/sv/tigervnc /run/runit/service/tigervnc
   sudo sv status tigervnc
   ```

4. SSH tunnel from the client, then view:

   ```sh
   ssh -N -L 5901:127.0.0.1:5901 alice@ARTIX_HOST
   # In another terminal on the client:
   vncviewer 127.0.0.1::5901
   ```

This mode calls `vncsession -D alice :1` in the foreground under runit.
It has its own dwm tags, windows and apps. It does **not** run LARBS's
`.xinitrc` or `~/.config/x11/xprofile` automatically. Add necessary startup
commands to the custom VNC session if your configuration requires them.

### Mode B: share an existing dwm desktop

1. Log into your actual X11/dwm session (for example with `startx`). In a
   terminal *inside that desktop*, check:

   ```sh
   printf 'display=%s\nauth=%s\n' "$DISPLAY" "${XAUTHORITY:-$HOME/.Xauthority}"
   ```

   Set `SHARE_DISPLAY` and, if necessary, `SHARE_XAUTHORITY` in the system
   config to the matching values. The service defaults to the normal startx
   convention of `:0` and `~/.Xauthority`. The Xauthority cookie must be
   readable by `VNC_USER`, which should own the running desktop.

2. Enable this service **instead of** the virtual one:

   ```sh
   sudo ln -s /etc/runit/sv/tigervnc-share /run/runit/service/tigervnc-share
   sudo sv status tigervnc-share
   ```

3. Connect through SSH (this service defaults to port 5900):

   ```sh
   ssh -N -L 5900:127.0.0.1:5900 alice@ARTIX_HOST
   # In another client terminal:
   vncviewer 127.0.0.1::5900
   ```

This mode runs `x0vncserver` as `VNC_USER` using runit's `chpst`. It mirrors
exactly your already-running dwm desktop, including its existing tags,
windows and apps. The runit service waits for the X11 socket, Xauthority
file and VNC password to become available, so it can be enabled at boot.
It does **not** create an X session. If the session exits, runit restarts
the service and it waits for the next X login.

For a nonstandard graphical login, `.Xauthority` may be in a different
location, and the shared service will wait until `SHARE_XAUTHORITY` is fixed.
The account also needs permission to read the Xauthority file and connect
to the display.

### Enable/disable/switch modes

```sh
# See status of either service
sudo sv status tigervnc
sudo sv status tigervnc-share

# Stop an enabled service
sudo sv down tigervnc
sudo sv down tigervnc-share

# Disable it for future boots too (example: independent session)
sudo rm /run/runit/service/tigervnc
# Note: for a persistent boot change, remove the service symlink
# from whichever runsvdir is your persistent/active service set.

# Restart after changing configuration
sudo sv restart tigervnc
sudo sv restart tigervnc-share
```

**Security:** Both scripts/configuration recipes restrict VNC to localhost.
Always SSH tunnel or use another properly secured transport; never expose
unencrypted VncAuth to the public network. Install/enable `sshd` separately
if you will use SSH. Port 5900 is used by `tigervnc-share`, port 5901 by
`tigervnc` unless customized.

## Files installed

- `/etc/runit/sv/tigervnc/run` — virtual session
- `/etc/runit/sv/tigervnc/log/run` — virtual session logger
- `/etc/runit/sv/tigervnc-share/run` — current desktop sharing
- `/etc/runit/sv/tigervnc-share/log/run` — desktop sharing logger
- `/etc/conf.d/tigervnc-runit` — shared config (pacman backup)
- `/usr/share/doc/tigervnc-runit/dwm-vnc.desktop` — optional dwm session entry
- `/usr/share/doc/tigervnc-runit/README.md` — this documentation

## Troubleshooting

- If local Xorg fails with `Device or resource busy` / `drmSetMaster failed`
  while Xvnc is running, stop the supervised service, not just its PID:
  `sudo sv down tigervnc`. Killing Xvnc alone lets runit start it again.
  Add `rendernode=` (empty, no quotes) to the VNC user's config before
  starting the virtual service again with `sudo sv up tigervnc`.
  For remote access to your physical desktop, leave `tigervnc` disabled
  and enable `tigervnc-share` instead. Check `/etc/tigervnc/vncserver-config-mandatory`
  if a system override defeats the user setting. See the upstream
  [Xvnc rendernode option](https://tigervnc.org/doc/Xvnc.html).
- `sudo tail -f /var/log/tigervnc/current` for the virtual session;
  `sudo tail -f /var/log/tigervnc-share/current` for desktop sharing.
- Virtual-session log: `~/.local/state/tigervnc/*.log` of `VNC_USER`.
- If the share service is active but no port listens, make sure
  `/tmp/.X11-unix/X0`, Xauthority and your VNC password file exist. The
  share run script waits quietly until these prerequisites exist.
- On an Xauthority error, run `echo "$XAUTHORITY"` inside dwm and set
  `SHARE_XAUTHORITY` accordingly. On a non-`:0` display update `SHARE_DISPLAY`.
- Both services need an actual graphical X11 server; only the virtual one
  can start its own server without a physical login.
- TigerVNC's `vncsession` uses PAM; your machine needs a working PAM setup.
- `x0vncserver` does not implement a new login or launch dwm by itself.

## Build and publish on AUR

This archive contains AUR Git source files, **not** a compiled binary and
**not** a published AUR entry. Update the maintainer field and confirm the
package name is free before publishing:

```sh
bash -n tigervnc.run tigervnc-share.run tigervnc.log.run \
  tigervnc-share.log.run PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -si
namcap PKGBUILD      # optional
```

Copy the source files, PKGBUILD and `.SRCINFO` to your AUR Git repository,
then `git add`, commit and `git push`. AUR publishing requires an AUR account.

TigerVNC is independently licensed upstream. The glue files shipped here
are 0BSD-licensed (see `LICENSE`).
