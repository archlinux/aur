# lxappearance-wlr

GTK3 theme switcher (LXAppearance) retargeted at **wlroots-based Wayland compositors** (labwc, sway, river, Hyprland, …). This repository contains only the `PKGBUILD`, patches and changelogs; upstream `lxde/lxappearance` (tag `0.6.4`) is checked out and patched at build time.

## Mouse Cursor tab (0.6.4-12)
- **Wayland-safe preview** rendered with `libXcursor` (`XcursorLibraryLoadImages`) — reads the theme's cursor files directly, no X server.
- **Visible size control** — the "Size of cursors" slider row was hidden in the upstream `.ui`; now shown, fixed to an 8–96 range, drives `XCURSOR_SIZE`.
- **Apply mirrors the cursor to the compositor** — writes `XCURSOR_THEME` / `XCURSOR_SIZE` idempotently to `~/.config/labwc/environment`, keeping comments and other variables.
- **labwc live reload** — under labwc (`$LABWC_PID` set), Apply also runs `labwc --reconfigure`. Other compositors are not touched.

> **Note:** not all wlroots compositors support changing the cursor theme on the fly. On some — and on older labwc versions — changes only take effect after the compositor is restarted. Already-running applications may keep the previous cursor until restarted.

## Other changes
- The desktop entry no longer ships an empty `NotShowIn=` key.

## Where settings go on Apply
| Target | Consumed by | Applied |
| --- | --- | --- |
| `gtk-3.0` / `gtk-4.0/settings.ini` | GTK apps | next GTK app launch |
| `gsettings org.gnome.desktop.interface` | GTK / portal-aware apps | immediately or next launch |
| `~/.config/labwc/environment` | labwc & wlroots compositors | next compositor start (labwc: `--reconfigure`) |

## Building
```bash
makepkg -fC                         # clone, patch, build, run check()
updpkgsums                          # refresh b2sums after editing a source
makepkg --printsrcinfo > .SRCINFO   # regenerate metadata
```

Patch and packaging rules live in `AGENTS.md`; release history in `CHANGELOG.en.md` / `CHANGELOG.ru.md`.
