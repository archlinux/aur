# PrettyZap — standalone Quickshell widget

A self-contained Quickshell widget for [PrettyZap](https://github.com/prettyletto/prettyzap):
a floating pill at the top-right of the screen that opens/hides the app and
offers Open / Hide, Settings, the WhatsApp/System theme toggle, and notification
mute control from a small popup. It needs only Quickshell — **not** Omarchy's `qs.Ui` kit — so it works on
plain Hyprland/Quickshell setups too.

## Run

```bash
quickshell -p ~/.config/quickshell/prettyzap
```

or, from a Quickshell config dir:

```bash
mkdir -p ~/.config/quickshell/prettyzap
cp -r . ~/.config/quickshell/prettyzap/
quickshell -c prettyzap
```

Autostart with the desktop:

```bash
quickshell -n -p ~/.config/quickshell/prettyzap
```

## Behavior

- **Left-click** the pill — open PrettyZap, or hide it when it is visible.
- **Middle-click** — open the PrettyZap settings window.
- **Right-click** — popup with Open / Hide, Settings, Theme, and notification
  mute/unmute buttons. An unread badge appears on the pill when WhatsApp Web
  reports unread items.
- **Status dot** — green: running; gray: installed but stopped; amber: the
  `prettyzap` binary is not on PATH.
- The pill floats above windows and reserves no screen space
  (`exclusiveZone: 0`). It sits at the top-right; move it by editing the
  `anchors`/`margins` at the top of `shell.qml`.

## Requirements

- Quickshell (a Wayland compositor session, e.g. Hyprland)
- PrettyZap installed (`prettyzap` on PATH)

## Configuration

The launch command defaults to `uwsm-app -- prettyzap`. On desktops without
`uwsm-app`, set the environment variable before launching quickshell:

```bash
PRETTYZAP_LAUNCH_COMMAND=prettyzap quickshell -p ~/.config/quickshell/prettyzap
```

## Notes

- The unread count comes from Chromium's WhatsApp Web page title (`(3)
  WhatsApp`), so it does not depend on private WhatsApp DOM selectors.
- Notification mute persists in `~/.config/prettyzap/shell-state.json`.
