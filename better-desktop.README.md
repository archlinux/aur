# better-desktop

`better-desktop` is the meta package for the Better Niri desktop. It depends on
every split package from the `niri-better` package base, so one install gets the
compositor and all companion applications:

| Component | Package | Binary | Purpose |
| --- | --- | --- | --- |
| selector | `better-desktop` | `better` | one command for every tool (`better shot`, `better monitor`, …) |
| niri | `niri-better` | `niri`, `niri-session` | compositor and session launcher |
| better-portal | `better-portal` | `better-portal`, `better-portal-picker` | standalone Screenshot/ScreenCast portal backend |
| better-companion | `better-companion` | `better-companion`, `companionctl` | window/workspace automation and parking daemon |
| better-shot | `better-shot` | `better-shot` | screenshot capture, clipboard, annotations |
| better-monitor | `better-monitor` | `better-monitor` | output profile save/apply/rollback |
| better-session | `better-session` | `better-session` | named workspace/window/output contexts |
| better-wallpaper | `better-wallpaper` | `better-wallpaper` | per-workspace wallpaper scenes |
| better-settings | `better-settings` | `better-settings`, `better-settingsctl` | GTK4 settings UI and CLI |
| better-audio | `better-audio` | `better-audio` | PipeWire routing rules and default sink |
| better-sidepanels | `better-sidepanels` | `better-sidepanels` | layer-shell panels with exclusive zones |

The companion packages are independent: install just the ones you need and skip
this meta package. Every package in the split comes from the same source
checkout and one build; installing one companion never rebuilds niri.

## Install

```sh
paru -S better-desktop     # or: yay -S better-desktop
```

To install only selected components:

```sh
paru -S niri-better better-shot better-settings
```

`niri-better` conflicts with `niri`, `niri-git` and `niri-elite-git` because all
of them install `/usr/bin/niri`, `/usr/bin/niri-session` and the same session
files. Remove the other package first or let your AUR helper resolve the
conflict. The companion packages have no such conflict.

## Post-install

1. Log out and pick **Niri** in your display manager, or run `niri-session` from
   a TTY.

2. If `better-portal` is installed, reload user units:

   ```sh
   systemctl --user daemon-reload
   ```

3. Start the standalone portal backend if you want `better-portal` to handle
   screenshots and screen casts:

   ```sh
   systemctl --user enable --now better-portal.service
   ```

   The D-Bus activation file also lets `xdg-desktop-portal` start it on demand.
   `xdg-desktop-portal` must be installed; `xdg-desktop-portal-gtk` is the
   recommended fallback for interfaces better-portal does not implement.

4. Choose the portal backend. The niri package installs niri's per-desktop
   `niri-portals.conf`, which selects niri's built-in backend. To use the
   standalone daemon instead, merge the two keys from
   `/usr/share/doc/better-portal/portals.conf.better.example` into
   `~/.config/xdg-desktop-portal/portals.conf`:

   ```ini
   [preferred]
   org.freedesktop.impl.portal.Screenshot=better;
   org.freedesktop.impl.portal.ScreenCast=better;
   ```

   Then restart the broker:

   ```sh
   systemctl --user restart xdg-desktop-portal.service
   ```

   Keep `org.freedesktop.impl.portal.Access=gtk;`,
   `org.freedesktop.impl.portal.Notification=gtk;` and a Secret provider in the
   same file if your existing configuration uses them.

5. Optional daemons are not enabled automatically. Start them from niri's
   `spawn-at-startup` lines or as user units, for example:

   ```kdl
   spawn-at-startup "better-companion"
   spawn-at-startup "better-wallpaper" "watch"
   spawn-at-startup "better-audio" "watch"
   spawn-at-startup "better-sidepanels"
   ```

6. Check the renderer after login:

   ```sh
   niri --check-vulkan
   ```

   The package builds the Vulkan renderer, but it stays opt-in
   (`NIRI_RENDERER=vulkan`). Without a working Vulkan device niri logs the
   reason and uses GLES.

See `/usr/share/doc/niri-better/PACKAGING.md` for the full compatibility
matrix, profile list and AUR instructions.
