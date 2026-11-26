# loom-desktop

`loom-desktop` is the meta package for the Loom Niri desktop. It depends on
every split package from the `loom-niri` package base, so one install gets the
compositor and all companion applications:

| Component | Package | Binary | Purpose |
| --- | --- | --- | --- |
| selector | `loom-desktop` | `loom` | one command for every tool (`loom shot`, `loom monitor`, …) |
| niri | `loom-niri` | `loom-niri`, `loom-niri-session` | coexisting compositor and session launcher |
| niri (replace) | `loom-niri-replace` | `niri`, `niri-session` | compositor under the niri names; conflicts with niri |
| loom-portal | `loom-portal` | `loom-portal`, `loom-portal-picker` | standalone Screenshot/ScreenCast portal backend |
| loom-companion | `loom-companion` | `loom-companion`, `loomctl` | window/workspace automation and parking daemon |
| loom-shot | `loom-shot` | `loom-shot` | screenshot capture, clipboard, annotations |
| loom-monitor | `loom-monitor` | `loom-monitor` | output profile save/apply/rollback |
| loom-session | `loom-session` | `loom-session` | named workspace/window/output contexts |
| loom-wallpaper | `loom-wallpaper` | `loom-wallpaper` | per-workspace wallpaper scenes |
| loom-settings | `loom-settings` | `loom-settings`, `loom-settingsctl` | GTK4 settings UI and CLI |
| loom-audio | `loom-audio` | `loom-audio` | PipeWire routing rules and default sink |
| loom-sidepanels | `loom-sidepanels` | `loom-sidepanels` | layer-shell panels and minimap |
| loom-tui | `loom-tui` | `loom-tui` | terminal dashboard |

The companion packages are independent: install just the ones you need and skip
this meta package. Every package in the split comes from the same source
checkout and one build; installing one companion never rebuilds niri.

## Install

```sh
paru -S loom-desktop     # or: yay -S loom-desktop
```

To install only selected components:

```sh
paru -S loom-niri loom-shot loom-settings
```

`loom-niri` conflicts with `niri`, `niri-git` and `niri-elite-git` because all
of them install `/usr/bin/niri`, `/usr/bin/niri-session` and the same session
files. Remove the other package first or let your AUR helper resolve the
conflict. The companion packages have no such conflict.

## Post-install

1. Log out and pick **Niri** in your display manager, or run `niri-session` from
   a TTY.

2. If `loom-portal` is installed, reload user units:

   ```sh
   systemctl --user daemon-reload
   ```

3. Start the standalone portal backend if you want `loom-portal` to handle
   screenshots and screen casts:

   ```sh
   systemctl --user enable --now loom-portal.service
   ```

   The D-Bus activation file also lets `xdg-desktop-portal` start it on demand.
   `xdg-desktop-portal` must be installed; `xdg-desktop-portal-gtk` is the
   recommended fallback for interfaces loom-portal does not implement.

4. Choose the portal backend. The niri package installs niri's per-desktop
   `niri-portals.conf`, which selects niri's built-in backend. To use the
   standalone daemon instead, merge the two keys from
   `/usr/share/doc/loom-portal/portals.conf.loom.example` into
   `~/.config/xdg-desktop-portal/portals.conf`:

   ```ini
   [preferred]
   org.freedesktop.impl.portal.Screenshot=loom;
   org.freedesktop.impl.portal.ScreenCast=loom;
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
   spawn-at-startup "loom-companion"
   spawn-at-startup "loom-wallpaper" "watch"
   spawn-at-startup "loom-audio" "watch"
   spawn-at-startup "loom-sidepanels"
   ```

6. Check the renderer after login:

   ```sh
   niri --check-vulkan
   ```

   The package builds the Vulkan renderer, but it stays opt-in
   (`NIRI_RENDERER=vulkan`). Without a working Vulkan device niri logs the
   reason and uses GLES.

See `/usr/share/doc/loom-niri/PACKAGING.md` for the full compatibility
matrix, profile list and AUR instructions.
