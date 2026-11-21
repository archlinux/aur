# mutter-native-xwayland

An Arch Linux (AUR) package of [GNOME Mutter](https://gitlab.gnome.org/GNOME/mutter)
51.1 with an **opt-in** Xwayland scaling mode that fixes
[mutter#3767](https://gitlab.gnome.org/GNOME/mutter/-/issues/3767).

By default Xwayland clients are rendered at a scale that is the *ceiling* of
the highest monitor scale. On a 1920×1080 monitor at 125% this makes the
Xwayland root window 3072×1728 instead of the expected 1920×1080. This
package adds a gsettings mode that makes Xwayland use the monitor's physical
resolution instead.

## What changes

- New enum `org.gnome.mutter.MetaXwaylandScalingMode` and key
  `xwayland-scaling-mode` in `org.gnome.mutter.wayland`:
  - `automatic` (default) — current upstream behavior: `ceil(highest monitor scale)`
  - `native` — use the highest monitor scale directly (1.25 at 125%, etc.)
- A non-zero `xwayland-scaling-factor` still takes precedence and rounds to an
  integer, so existing overrides keep working.
- Surface/buffer scale math was generalized from integers to doubles so
  fractional scales such as 1.25 can be expressed correctly.
- Xwayland `wl_output.scale` is `MAX(1, floor(effective scale))` and the xdg
  logical size is scaled by the effective scale.
- Includes a 7-case regression test suite (`mutter-xwayland-scaling`).

The patch is a single file, [`0001-xwayland-native-scaling-mode.patch`](0001-xwayland-native-scaling-mode.patch),
and applies cleanly to upstream mutter 51.1.

## Install

From the AUR (for example with `yay`):

```sh
yay -S mutter-native-xwayland
```

This package **conflicts with and provides `mutter`**, so it replaces the
official package. It also splits into `mutter-native-xwayland-devkit` and
`mutter-native-xwayland-docs`, which provide/conflict with their official
counterparts.

To build manually:

```sh
makepkg -si
```

## Usage

The default is `automatic`, so installing the package does not change anything
by itself. To enable native scaling:

```sh
gsettings set org.gnome.mutter.wayland xwayland-scaling-mode 'native'
```

Log out and back in (or restart mutter/Xwayland) for the change to take effect.
To go back to upstream behavior:

```sh
gsettings reset org.gnome.mutter.wayland xwayland-scaling-mode
```

With a 1920×1080 monitor at 125%:

| Mode | Effective scale | Xwayland root window |
| --- | --- | --- |
| `automatic` (default) | 2.0 | 3072×1728 |
| `native` | 1.25 | 1920×1080 |
| `xwayland-scaling-factor=1` override | 1.0 | 1536×864 |

## Caveats

- On mixed-scale layouts, `native` uses the **highest** monitor scale, so the
  result is approximate for the other monitors.
- If the monitor layout mode is `physical` (rather than `logical`), Xwayland
  already uses the physical resolution and `xwayland-scaling-mode` has no
  effect.
- This is a downstream patch: it is intended to be upstreamable later, but is
  not in upstream mutter yet.

## Repository contents

- `PKGBUILD` — AUR package build recipe
- `.INSTALL` — post-install note shown by pacman
- `.SRCINFO` — generated AUR metadata (do not edit by hand)
- `0001-xwayland-native-scaling-mode.patch` — the mutter 51.1 patch

## License

Mutter and this packaging are licensed under `GPL-2.0-or-later`. See the
upstream [LICENSE](https://gitlab.gnome.org/GNOME/mutter/-/blob/main/COPYING)
and the `LICENSES/` directory.
