# ttf-inter-hinted

[Inter](https://rsms.me/inter/) 4.1 re-hinted with ttfautohint for FreeType,
optionally Nerd Fonts patched. Build options and the reasons for the default
`sharp` preset are documented in the header of `PKGBUILD`.

This file covers **what you need so the hints in this package are actually
used**, and the Inter-specific measurements. The full explanation of the
rendering pipeline (GTK4 → pango → cairo → FreeType) is shared with the sibling
package `nerd-fonts-apple-hinted`. See its `README.md`, which covers the source
references, verification methods and testing pitfalls.

Measured on 2026-09-29: GNOME 50.5 on Wayland, GTK 4.22.5, cairo 1.18.6,
FreeType 2.14.3, all displays at scale 1.0.

---

## Recommended settings

| Where | Setting | Why |
|---|---|---|
| `/etc/fonts/conf.d/` | symlink `80-ttf-inter-hinted.conf` | hintmedium + autohint off for Inter / Inter Display only |
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'` | In `automatic` GTK4 forces hintslight and ignores the snippet |
| gsettings `org.gnome.desktop.interface` | `font-hinting 'medium'`, `font-antialiasing 'grayscale'` | What GTK3/GTK4 read on Wayland (not `gtk-xft-*` in settings.ini) |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | Metric hinting makes Inter lighter and changes line height |
| Firefox `user.js` / about:config | `gfx.text.subpixel-position.force-enabled = true` | At hintmedium Firefox rounds advances to whole pixels (uneven gaps); see the sibling README §9 |
| build | default `HINT_PRESET=sharp` | Keeps i/j dots and diaereses clear (see below) |

```sh
sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-inter-hinted.conf /etc/fonts/conf.d/
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting medium
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
# gtk-4.0/settings.ini: gtk-hint-font-metrics=false
# Firefox profile user.js (restart Firefox): user_pref("gfx.text.subpixel-position.force-enabled", true);
```

The snippet on its own is **not enough** for GTK4/libadwaita apps. Fontconfig
clients such as Chrome/Electron follow it, but GTK4 in automatic mode sets
`CAIRO_HINT_STYLE_SLIGHT` explicitly, and cairo gives that priority over
fontconfig's hintstyle.

---

## Measurements (installed package, `sharp` preset)

**hintslight ignores the hints.** Bitmap hashes for `Inter-Regular.ttf`,
13 and 15 px, text "Hamburgefonstiv Αλφάβητο 0123":

| FreeType load mode | Result |
|---|---|
| `TARGET_LIGHT` (hintslight) | identical to `LIGHT + FORCE_AUTOHINT` → FreeType's autohinter |
| `TARGET_NORMAL` (hintmedium) | identical to `NORMAL + NO_AUTOHINT` → the package's ttfautohint bytecode |

**Dots and diaereses.** The test counts glyphs where the dot or diaeresis
touches the letter body, meaning no pixel row below 25% coverage separates them.
It covers `i j ï ä ö ü ϊ ë` × Regular, Medium, SemiBold, Bold, ExtraBold,
Italic and Bold Italic, 56 cases per size:

| mode | 10px | 11px | 12px | 13px | 14px | 15px | 16px |
|---|---|---|---|---|---|---|---|
| bytecode (hintmedium) | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| autohinter (hintslight) | 0 | 0 | 0 | 1 | 0 | 0 | 0 |

The `sharp` preset works as intended. The PKGBUILD notes measured 72 of 490
failures for upstream's `q` stems and 7 for `s`.

**Real GTK4 rendering**, Inter 11 pt (Regular + Bold), offscreen GSK render.
"Ink" is the mean darkness, and edgeY/edgeX are the mean pixel gradients:

| GTK mode | height | ink | edgeY | edgeX |
|---|---|---|---|---|
| automatic (slight → autohinter) | 71 px | 31.73 | 20.74 | 27.95 |
| manual, medium, metric hinting on | **76 px** | 29.22 | 19.09 | 25.96 |
| **manual, medium, metric hinting off** | 71 px | 31.79 | 20.75 | 27.85 |

Metric hinting rounds Inter's line height up (four lines went from 71 to 76 px)
and makes the text lighter and softer, which is why it is turned off.
With metric hinting off, the weight is the same as before, and the vertical
alignment now comes from the package's own hints.

---

## Differences from nerd-fonts-apple-hinted

- Inter's best preset is `sharp` (`s`). For SF Pro Text it is `balanced` (`q`):
  there `s` and `n` glue the dots at 10–12 px.
- Upstream Inter static TTFs are already hinted (ttfautohint `qqq`). Apple's
  OTFs are effectively unhinted. `HINTING=false` is therefore a reasonable
  fallback for Inter, but not for SF Pro.
- Inter keeps the same x-height in every weight, so its variable font hints as
  well as the statics.

## Sources

- [GTK blog – On fractional scales, fonts and hinting](https://blog.gtk.org/2024/03/07/on-fractional-scales-fonts-and-hinting/)
- [Gtk.Settings:gtk-font-rendering](https://docs.gtk.org/gtk4/property.Settings.gtk-font-rendering.html)
- [FreeType – On slight hinting, proper text rendering, stem darkening and LCD filters](https://freetype.org/freetype2/docs/hinting/text-rendering-general.html)
- GTK 4.22.5 `gtk/gtkwidget.c`, `gdk/wayland/gdksettings-wayland.c`; cairo `src/cairo-ft-font.c`
