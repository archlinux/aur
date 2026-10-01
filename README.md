# ttf-inter-hinted

[Inter](https://rsms.me/inter/) 4.1 re-hinted with ttfautohint for FreeType,
optionally Nerd Fonts patched. Build options and the reasons for the default
`natural` preset are documented in the header of `PKGBUILD`.

This file covers **the desktop settings that decide how Inter actually
renders**, and the Inter-specific measurements. The full explanation of the
rendering pipeline (GTK4 → pango → cairo → FreeType) is shared with the sibling
package `nerd-fonts-apple-hinted`. See its `README.md`, which covers the source
references, verification methods and testing pitfalls.

Measured on 2026-09-29: GNOME 50.5 on Wayland, GTK 4.22.5, cairo 1.18.6,
FreeType 2.14.3, displays at ~92, ~143 and ~190 dpi, all at scale 1.0.

---

## Two setups

| | A: smooth (recommended) | B: package bytecode |
|---|---|---|
| Hinter | FreeType light autohinter + stem darkening | the package's ttfautohint bytecode |
| Look | sharp baseline and x-height, soft, even strokes, slightly fuller | higher contrast, crisper stems |
| Uses this package's hints | no | yes |
| fontconfig snippet | **off** | on |

### A: hintslight + stem darkening

| Where | Setting | Why |
|---|---|---|
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'`, `font-hinting 'slight'`, `font-antialiasing 'grayscale'` | What GTK3/GTK4 read on Wayland |
| `~/.config/environment.d/90-freetype.conf` | `FREETYPE_PROPERTIES` with `autofitter:no-stem-darkening=0` | Stem darkening evens out thin grayscale strokes |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | Metric hinting changes Inter's line height (see below) |
| `/etc/fonts/conf.d/` | **no** `80-ttf-inter-hinted.conf`, `10-hinting-slight.conf` | So Chrome/Firefox/Electron also use hintslight |

```sh
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting slight
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
cat > ~/.config/environment.d/90-freetype.conf <<'EOF'
FREETYPE_PROPERTIES="truetype:interpreter-version=40 cff:no-stem-darkening=0 autofitter:no-stem-darkening=0 type1:no-stem-darkening=0 t1cid:no-stem-darkening=0"
EOF
sudo rm -f /etc/fonts/conf.d/80-ttf-inter-hinted.conf /etc/fonts/conf.d/10-hinting-medium.conf
sudo ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
# gtk-4.0/settings.ini: gtk-hint-font-metrics=false; then log out and back in
```

Put `FREETYPE_PROPERTIES` in `environment.d`, not in `/etc/profile.d`. The
GNOME session gets its environment from systemd, and profile scripts are only
read by POSIX login shells. With fish as the login shell,
`/etc/profile.d/freetype2.sh` never reached gnome-shell or any app. Check it
after logging in:

```sh
tr '\0' '\n' < /proc/$(pgrep -xu $USER gnome-shell)/environ | grep FREETYPE
```

Stem darkening only works with the autohinter and CFF, so it has no effect on
setup B. The FreeType docs warn that without linear blending darkened text can
look heavy. With Inter at 11 pt it measured about 7% more ink, and the dots
stay clear (see below).

### B: the package's bytecode hints

| Where | Setting | Why |
|---|---|---|
| `/etc/fonts/conf.d/` | symlink `80-ttf-inter-hinted.conf` | hintmedium + autohint off for Inter / Inter Display only. Chromium/Electron are excluded |
| fontconfig, if hintmedium is global | `prgname` rule → `hintslight` for chrome, chromium, brave, helium, electron, code, … | At scale 1 Chromium rounds every glyph advance at hintmedium; see the sibling README §10 |
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'`, `font-hinting 'medium'`, `font-antialiasing 'grayscale'` | In `automatic` GTK4 forces hintslight and ignores the snippet |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | Metric hinting makes Inter lighter and changes line height |
| Firefox `user.js` / about:config | `gfx.text.subpixel-position.force-enabled = true` | At hintmedium Firefox rounds advances to whole pixels (uneven gaps); see the sibling README §9 |
| build | default `HINT_PRESET=natural` | Least distortion of the bytecode presets (see below) |

```sh
sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-inter-hinted.conf /etc/fonts/conf.d/
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting medium
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
# gtk-4.0/settings.ini: gtk-hint-font-metrics=false
# Firefox profile user.js (restart Firefox): user_pref("gfx.text.subpixel-position.force-enabled", true);
```

The snippet on its own is **not enough** for GTK4/libadwaita apps. Fontconfig
clients such as Firefox follow it, but GTK4 in automatic mode sets
`CAIRO_HINT_STYLE_SLIGHT` explicitly, and cairo gives that priority over
fontconfig's hintstyle.

The snippet skips Chromium and Electron apps by `prgname` (chrome, chromium,
brave, helium, electron, code, slack, signal-desktop, vesktop). At device
scale 1 Chromium uses linear advances only at hintslight/none, so at
hintmedium every glyph advance becomes a whole pixel. The snippet loads at
priority 80, after `~/.config/fontconfig/fonts.conf` (50), so without this
exclusion it would undo a per-app `hintslight` rule there. Before pkgrel 3 it
did: Chrome rendered Inter, the usual `sans-serif`, at hintmedium while
SF Pro Text got hintslight. Check with a renamed copy of `fc-match`, since
prgname is the executable's basename:

```sh
cp /usr/bin/fc-match /tmp/chrome
/tmp/chrome 'Inter:pixelsize=16' --format='%{family[0]} hintstyle=%{hintstyle}\n'
# expected: Inter hintstyle=1
```

---

## Measurements

**hintslight ignores the hints.** Bitmap hashes for `Inter-Regular.ttf`,
13 and 15 px, text "Hamburgefonstiv Αλφάβητο 0123":

| FreeType load mode | Result |
|---|---|
| `TARGET_LIGHT` (hintslight) | identical to `LIGHT + FORCE_AUTOHINT` → FreeType's autohinter |
| `TARGET_NORMAL` (hintmedium) | identical to `NORMAL + NO_AUTOHINT` → the package's ttfautohint bytecode |

**Shape.** Real GTK4 (GSK) renders of a Latin + Greek line, Inter Regular and
SemiBold at 12, 13, 14.67 (= 11 pt) and 16 px, grayscale, metric hinting off.
"Deviation" is the summed coverage difference from an 8× supersampled unhinted
render of the same text, in % of its ink, at the best 1/8-px alignment. Lower
means closer to the designed outline. edgeX/edgeY are the mean pixel gradients
(sharpness), and ink is the mean darkness.

| Rendering | deviation | edgeX | edgeY | ink |
|---|---|---|---|---|
| bytecode, preset `sharp` (sss) | **18.1** | 18.91 | 12.67 | 19.40 |
| bytecode, preset `balanced` (qsq) | 15.4 | – | – | – |
| bytecode, preset `natural` (nnn) | 12.9 | 18.30 | 12.66 | 19.03 |
| hintslight (autohinter) | 12.8 | 18.29 | 12.68 | 19.04 |
| hintslight + stem darkening | 15.6¹ | 18.52 | 13.01 | 20.33 |
| no hinting | 7.6 | 18.13 | 12.17 | 18.98 |

¹ Darkening deliberately adds weight (+7% ink), which the deviation counts. The
shape itself is the hintslight one.

`sharp` gains about 3% edge contrast over `natural` and pays for it with 40%
more deviation. You see that as harsh, slightly distorted letters, worst at
13 px (deviation 29.7 vs 17.7 for Regular), where the top of `0` breaks open
so that it reads like `U`. That is why the
default preset is now `natural`. `natural` and hintslight are practically the
same, as ttfautohint's documentation says ("this is what FreeType uses for its
'light' hinting mode").

**Dots and diaereses.** FreeType 2.14.3, glyphs rendered on an integer origin.
The test counts glyphs where the dot or diaeresis touches the letter body,
meaning no pixel row below 25% coverage separates them. It covers
`i j ï ä ö ü ϊ ë` × Regular, Medium, SemiBold, Bold, ExtraBold, Italic and
Bold Italic, 56 cases per size, 392 in total:

| mode | 10px | 11px | 12px | 13px | 14px | 15px | 16px |
|---|---|---|---|---|---|---|---|
| bytecode `sharp` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| bytecode `natural` / `light` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| hintslight | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| hintslight + stem darkening | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

Earlier PKGBUILD notes said `n` stems glued the dots in 72 of 490 cases. That
does not reproduce, so the dots are no reason to pick `sharp`.

**Metric hinting**, Inter 11 pt (Regular + Bold), offscreen GSK render:

| GTK mode | height | ink | edgeY | edgeX |
|---|---|---|---|---|
| automatic (slight → autohinter) | 71 px | 31.73 | 20.74 | 27.95 |
| manual, medium, metric hinting on | **76 px** | 29.22 | 19.09 | 25.96 |
| **manual, medium, metric hinting off** | 71 px | 31.79 | 20.75 | 27.85 |

Metric hinting rounds Inter's line height up (four lines went from 71 to 76 px)
and makes the text lighter and softer, which is why it is turned off.

### Testing pitfalls met here

- `pango-view --hint-metrics=off` (and any cairo test without GTK) puts the
  baseline on fractional pixels. That blurs the vertical hinting and invents
  differences between presets. Use GSK renders (`Gtk.WidgetPaintable` →
  `render_texture`) or FreeType directly.
- Build each variant from the upstream zip into its own directory. Don't
  compare against `/usr/share/fonts/inter`: a reinstall during the test
  silently changes what you measure (check `/var/log/pacman.log`).

---

## Differences from nerd-fonts-apple-hinted

- Inter's best bytecode preset is `natural` (`n`). For SF Pro Text it is
  `balanced` (`q`): there `s` and `n` glue the dots at 10–12 px.
- Upstream Inter static TTFs are already hinted (ttfautohint `qqq`). Apple's
  OTFs are effectively unhinted. `HINTING=false` is therefore a reasonable
  fallback for Inter, but not for SF Pro.
- Inter keeps the same x-height in every weight, so its variable font hints as
  well as the statics.

## Sources

- [GTK blog – On fractional scales, fonts and hinting](https://blog.gtk.org/2024/03/07/on-fractional-scales-fonts-and-hinting/)
- [Gtk.Settings:gtk-font-rendering](https://docs.gtk.org/gtk4/property.Settings.gtk-font-rendering.html)
- [FreeType – On slight hinting, proper text rendering, stem darkening and LCD filters](https://freetype.org/freetype2/docs/hinting/text-rendering-general.html)
- [ttfautohint documentation – stem width modes, increase-x-height](https://freetype.org/ttfautohint/doc/ttfautohint.html)
- [ArchWiki – Font configuration](https://wiki.archlinux.org/title/Font_configuration)
- GTK 4.22.5 `gtk/gtkwidget.c`, `gdk/wayland/gdksettings-wayland.c`; cairo `src/cairo-ft-font.c`
