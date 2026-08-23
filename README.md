# atmosphera-mangowc

AUR meta package: [Atmosphera](https://github.com/alexindigo/atmosphera) shell on MangoWC.

Pulls in everything needed for an Atmosphera session on mangowc:

- `atmosphera` — the shell (satisfied by `atmosphera` or `atmosphera-git`)
- `mangowm` — the compositor (AUR package for mangowc)
- `qt6-mangowcqml` — mangowc IPC QML module (workspaces/tags, windows, focus, keymode)

## Install

```
yay -S atmosphera-mangowc
```

## Notes

- mangowc has no autostart config keyword; launch Atmosphera from your session
  launcher with `XDG_CURRENT_DESKTOP=mango` set (see the Atmosphera README's
  per-compositor setup section).
- Optional extras: `cliphist` (clipboard history), `wlsunset` (night light).
