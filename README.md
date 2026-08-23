# atmosphera-niri

AUR meta package: [Atmosphera](https://github.com/alexindigo/atmosphera) shell on niri.

Pulls in everything needed for an Atmosphera session on niri:

- `atmosphera` — the shell (satisfied by `atmosphera` or `atmosphera-git`)
- `niri` — the compositor
- `qt6-niriqml` — niri IPC QML module (workspaces, windows, session config)
- `xwayland-satellite` — X11 application support for niri

## Install

```
yay -S atmosphera-niri
```

## Notes

- After install, run `atmosphera-niri-setup` once to compose the niri session
  config (or include `Configs/niri/atmosphera.kdl` manually).
- Optional extras: `cliphist` (clipboard history), `wlsunset` (night light),
  `keyd` + `xremap-niri-bin` (bindings environments).
