# sbxkb 0.8.0

A small X11 keyboard layout indicator and switcher, based on sbxkb 0.7.6.
Written in C11, with **Xlib and libpng** as its direct library dependencies.
The original flag images and GPL licensing are preserved.

The modernized implementation, bug fixes, tests, and Arch Linux packaging were
authored by **Codex (OpenAI), 2026**. Original sbxkb authors are Yrij Tuljakov,
Anatoly Asviyan, and Peter Zelezny; flag artwork is by Andi Peredri.

## Build and run

Install a C compiler, make, pkg-config, and the development files for Xlib and
libpng. On Arch Linux these are `base-devel`, `libx11`, and `libpng`; on Debian
these are `build-essential`, `pkg-config`, `libx11-dev`, and `libpng-dev`.

```sh
make
./sbxkb
```

Run it in an X11 session with an **XEmbed system tray**, such as those provided
by tint2, trayer, stalonetray, or an X11 panel. It waits if the tray is not running
and reconnects when the tray appears or restarts. This version does not implement
StatusNotifierItem or native Wayland keyboard layout tracking. On Wayland,
Xwayland's keyboard state does not represent the whole desktop.

Left click cycles layouts. Scroll up selects the previous layout; scroll down
selects the next one. Each application window remembers its layout, including
when focus moves between child widgets. New windows start with the layout active
when sbxkb started or the keymap was last replaced. To keep one layout globally:

```sh
./sbxkb --global
```

Configure layouts with your desktop settings or `setxkbmap`; sbxkb follows live
keymap changes. On window managers without `_NET_ACTIVE_WINDOW`, input focus is
checked every 150 ms. Only one sbxkb instance may run per X screen. Stop it with
Ctrl+C or SIGTERM.

## Autostart

The Arch package installs `sbxkb.desktop` to `/etc/xdg/autostart/`, enabling it
at login in sessions that support XDG autostart. The icon waits for the tray to
appear, so no startup delay is needed. Use this with an X11 session.

For a source installation, install the executable into your session's `PATH`,
then enable autostart for your account:

```sh
install -Dm644 sbxkb.desktop "${XDG_CONFIG_HOME:-$HOME/.config}/autostart/sbxkb.desktop"
```

To disable the package's autostart for your account, create a file with the same
name in your configuration directory containing:

```ini
[Desktop Entry]
Type=Application
Name=sbxkb
Hidden=true
```

Standalone window managers may require an XDG autostart runner or an explicit
`sbxkb` command in their startup configuration.

## Install

```sh
make install DESTDIR=/tmp/sbxkb-package  # stage files for packaging
```

For an installation in your home directory, build with the matching data path:

```sh
make clean
make PREFIX="$HOME/.local"
make install PREFIX="$HOME/.local"
```

The default prefix is `/usr/local`. `DESTDIR` stages a package without changing
runtime paths. Use `make uninstall` with the same prefix to remove installed files.

## Icons and transparency

Flag files are loaded independently in this order:

1. `--icons-dir DIRECTORY`, if given.
2. `~/.icons/flags/` (compatible with the original sbxkb).
3. The compiled installation data directory.
4. `images/` relative to the working directory, for source-tree runs.

Files use the complete XKB layout identifier, such as `us.png`, `ru.png`, or
`custom.png`. Missing or invalid images produce a readable layout badge. PNGs
larger than 1024 pixels in either dimension are rejected. Layout variants retain
the base layout's flag; their group names remain available as the icon's window
title.

The icon uses the visual advertised by the tray. With a 32-bit ARGB visual it
renders premultiplied alpha and transparent margins. With an ordinary visual it
inherits the panel background using `ParentRelative`; transparent flag pixels
are masked so the panel shows through. Images keep their aspect ratio as the
panel resizes the icon.

## Changes from 0.7.6

- Replaced GTK2, GDK, GLib, gdk-pixbuf-xlib, EggTrayIcon, and the old Autotools
  build with C11, Xlib, libpng, and a Makefile.
- Recreate and redock the icon after tray selection changes, panel destruction,
  or destruction of the embedded icon. Detect late tray startup even if the host
  omits its `MANAGER` announcement. Keep singleton ownership independent of the
  disposable tray window.
- Respect the tray's visual and render transparent backgrounds correctly.
- Removed the dangling stack pointer in the original flag cache and made image
  ownership explicit.
- Accept unfamiliar and non-country layouts without assertions or process exit;
  bound property parsing and provide a fallback when a flag is missing.
- Monitor XKB map, names, new-keyboard, and group changes; reset saved window
  groups on keymap replacement and normalize an out-of-range current group.
- Preserve X11 window IDs without integer truncation; distinguish an unseen window
  from a window with saved group zero; normalize child focus to its client window.
- Keep X11 event handling local, avoiding the original global GTK event filter
  that consumed destruction events needed by the tray implementation.
- Fail cleanly when X11/XKB is unavailable; release resources on SIGINT/SIGTERM.

## Tests

The integration suite needs Xvfb and setxkbmap in addition to the build tools.
It always starts a private X server and never changes your desktop's keymap.

```sh
make check
```

On Linux sandboxes that prohibit socket listeners but allow local socket-pair
IPC, a Python 3 test runner and a test-only transport shim are available:

```sh
make check SBXKB_TEST_TRANSPORT=socketpair
```

The latter still runs a real Xvfb server and real X11 requests, passing connected
socket descriptors through local IPC instead of opening listening sockets. The
shim is compiled into a temporary directory and never linked into sbxkb.

Tests check tray startup/restarts, destruction of the icon alone, ordinary and
ARGB backgrounds, transparent PNGs, missing flags, duplicate processes, click and
scroll switching, per-window/child focus, live keymap replacement, global mode,
truncated properties, and command-line failures.

## Upstream and license

The untouched upstream tarball and its provenance are in `upstream/`. sbxkb is
licensed under GPL-3.0-or-later; see `COPYING`. Flag artwork is by Andi Peredri;
see `images/README` for its original license and attribution.
