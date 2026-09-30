# nerd-fonts-apple-hinted

Apple's SF Pro, SF Mono and New York fonts, converted to TrueType and hinted
with ttfautohint (optionally Nerd Fonts patched). Build options are documented
in the header of `PKGBUILD`.

This file records **how these fonts actually get rendered on a GNOME/Wayland
desktop, and which settings you need so the hints in the package are used**.
It is based on source reading and measurements made on 2026-09-29.

Test system: HP OmniBook Ultra 14, GNOME 50.5 on Wayland, GTK 4.22.5,
cairo 1.18.6, pango 1.58.2, FreeType 2.14.3, fontconfig 2.18.3. Three displays,
all at scale 1.0: the built-in 2240×1400 14" panel (~190 dpi), an ASUS MB16AMT
15.6" 1080p (~141 dpi) and a Dell S2725HS 27" 1080p (~81 dpi).

---

## TL;DR — recommended settings

| Where | Setting | Why |
|---|---|---|
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'` | Without it GTK4 forces `hintslight`, which ignores the package's hints |
| gsettings `org.gnome.desktop.interface` | `font-hinting 'medium'` | FreeType runs TrueType bytecode only at medium/full |
| gsettings `org.gnome.desktop.interface` | `font-antialiasing 'grayscale'` | GTK4 cannot do subpixel AA; keeps every toolkit consistent |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | Integer advances give uneven letter gaps; there is no gsettings key for this |
| fontconfig (global or the shipped snippet) | `hinting=true`, `hintstyle=hintmedium`, `autohint=false`, `rgba=none` | For fontconfig clients (Firefox, GTK3 fallbacks, etc.) |
| `/etc/fonts/conf.d/` | symlink `80-nerd-fonts-apple-hinted.conf` | Enables bytecode hinting for these families only, even if the global default is slight. Chromium/Electron are excluded (§10) |
| fontconfig, if hintmedium is global | `prgname` rule → `hintslight` for chrome, chromium, brave, helium, electron, code, … | At scale 1 Chromium rounds every glyph advance at hintmedium; no flag fixes it (§10) |
| environment | **no** `FREETYPE_PROPERTIES` stem-darkening tweak | It does not affect TrueType bytecode hinting at all |
| Firefox `user.js` / about:config | `gfx.text.subpixel-position.force-enabled = true` | At hintmedium Firefox rounds glyph advances and turns off subpixel positioning (§9) |
| build | default `HINT_PRESET=balanced`, not `natural` | `natural` glues i/j dots and diaereses at 10–12 px (§8) |
| build | default `TRACKING=true` | Adds STAT so HarfBuzz applies Apple's `trak` size-specific tracking (§11) |

Apply it:

```sh
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting medium
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
# gtk-4.0/settings.ini: gtk-hint-font-metrics=false
sudo ln -s /usr/share/fontconfig/conf.avail/80-nerd-fonts-apple-hinted.conf /etc/fonts/conf.d/
# Firefox profile user.js (restart Firefox): user_pref("gfx.text.subpixel-position.force-enabled", true);
```

On this machine `~/.scripts/import-gsettings.sh` does the gsettings part and
regenerates `~/.config/gtk-4.0/settings.ini` from `~/.config/gtk-3.0/settings.ini`
(it then locks the directory with `chattr +i`, so do not edit the gtk-4.0 file
by hand). Its source of truth is `gtk-xft-hintstyle` / `gtk-xft-rgba` in the
gtk-3.0 file.

Restart applications afterwards. Log out and back in for GNOME Shell to pick up the change.

---

## How the pieces fit together

```
app ──► pango ──► cairo font options ──┐
                                        ├─► cairo merges ──► FreeType load flags ──► glyph bitmap
fontconfig pattern (fonts.conf) ───────┘
```

Two layers can ask for a hint style: the **toolkit** (through cairo font
options on the pango context) and **fontconfig** (through the matched
pattern). What the font file contains only matters if the final FreeType load
mode actually executes its bytecode.

### 1. GTK4 `font-rendering=automatic` overrides everything

Since GTK 4.16 there is a `gtk-font-rendering` setting. In GTK 4.22.5,
`gtk_widget_update_pango_context()` (`gtk/gtkwidget.c`) does this in
**automatic** mode (the default):

```c
options = cairo_font_options_create ();
cairo_font_options_set_antialias   (options, CAIRO_ANTIALIAS_GRAY);
cairo_font_options_set_hint_metrics(options, CAIRO_HINT_METRICS_OFF);
cairo_font_options_set_hint_style  (options, CAIRO_HINT_STYLE_SLIGHT);
pango_context_set_round_glyph_positions (context, FALSE);
```

So in automatic mode **every GTK4/libadwaita app renders with hintslight**,
regardless of `font-hinting`, `gtk-xft-hintstyle` or fontconfig. Only in
**manual** mode does GTK build the options from `gtk-xft-antialias`,
`gtk-xft-hinting`, `gtk-xft-hintstyle` and `gtk-hint-font-metrics`.

### 2. cairo lets the toolkit override fontconfig

In `_cairo_ft_options_merge()` (`src/cairo-ft-font.c`), `options` are the
context's options and `other` the fontconfig pattern's:

```c
if (options->base.hint_style == CAIRO_HINT_STYLE_DEFAULT)
    options->base.hint_style = other->base.hint_style;
```

Fontconfig's `hintstyle` is used **only if the toolkit left it at DEFAULT**.
GTK4 in automatic mode sets SLIGHT explicitly, so `hintmedium` in `fonts.conf`
is silently ignored for GTK4. Then SLIGHT → `FT_LOAD_TARGET_LIGHT`, and
MEDIUM → `FT_LOAD_TARGET_NORMAL`.

### 3. `hintslight` does not use the package's hints

Measured with a small FreeType program: it renders a string with each load mode
and hashes the bitmaps. The font is `SF-Pro-Text-Regular.ttf` from this package,
the text is "Hamburgefonstiv Αλφάβητο 0123", and the result is the same at 13 and 15 px:

| Load mode | Result |
|---|---|
| `NO_HINTING` | unique |
| `TARGET_LIGHT` (hintslight) | **identical to `LIGHT + FORCE_AUTOHINT`** |
| `TARGET_LIGHT + NO_AUTOHINT` | identical to NORMAL |
| `TARGET_NORMAL` (hintmedium) | **identical to `NORMAL + NO_AUTOHINT`** → runs the ttfautohint bytecode |
| `TARGET_NORMAL + FORCE_AUTOHINT` | unique |

In other words, with hintslight FreeType uses **its own light autohinter** and
the TrueType instructions written by ttfautohint are never executed. They only
run at hintmedium/hintfull. That is the whole point of `font-rendering=manual`
plus `font-hinting=medium`.

hintmedium and hintfull render identically in cairo/pango. Chrome turns off
subpixel positioning at hintfull, so medium is preferred (see the PKGBUILD notes).

### 4. Where GTK4 reads each setting on Wayland

From `gdk/wayland/gdksettings-wayland.c` (GTK 4.22.5), confirmed at runtime:
`settings.ini` said `gtk-xft-hinting=0`, yet GTK reported 1.

| GtkSettings property | Source on GNOME/Wayland |
|---|---|
| `gtk-font-rendering` | gsettings `font-rendering` (wins over settings.ini) |
| `gtk-xft-antialias`, `gtk-xft-rgba` | gsettings `font-antialiasing`, `font-rgba-order` |
| `gtk-xft-hinting`, `gtk-xft-hintstyle` | gsettings `font-hinting` |
| `gtk-hint-font-metrics` | **only** `~/.config/gtk-4.0/settings.ini` (no gsettings key) |

Check what an app sees:

```sh
python3 -c "
import gi; gi.require_version('Gtk','4.0'); from gi.repository import Gtk
Gtk.init(); s=Gtk.Settings.get_default()
for p in ['gtk-font-rendering','gtk-xft-hinting','gtk-xft-hintstyle','gtk-xft-antialias','gtk-hint-font-metrics']:
    print(p, s.get_property(p))"
# expected: gtk-font-rendering 1 (MANUAL), 1, hintmedium, 1, False
```

### 5. Grayscale is correct

- GTK4 has no subpixel (ClearType-style) text: its compositing has no
  component alpha, so AA is always grayscale and `gtk-xft-rgba` does little.
- Turning on `rgba` would change only GTK3 and fontconfig clients such as
  Chrome, so different apps would render differently. It also gains little on
  the ~190 dpi panel.
- Keep `rgba=none` in fontconfig and `font-antialiasing 'grayscale'`.

### 6. Metric hinting (`gtk-hint-font-metrics`)

With `true`, pango rounds glyph advances to whole pixels. This also turns off
subpixel positioning. At 11 pt the letter gaps come out slightly uneven. With `false`,
glyphs are placed at fractional x positions. GTK still rounds the **y**
position to whole device pixels whenever hinting is on, so the vertical
(x-height, baseline) snapping from the bytecode is kept. The hints are
effectively vertical-only under FreeType's v40 interpreter anyway, so `false`
is the better combination.

### 7. Stem darkening does not apply here

The popular `FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"`
only affects the **CFF driver** and the **autohinter**. With the recommended
settings these fonts go through the TrueType bytecode interpreter, so the
variable has no effect on them. It only helps setups that use hintslight
(autohinter) or unhinted OTF/CFF fonts.

### 8. HINT_PRESET: keep `balanced` (q)

**Overall look.** Real GSK renders of SF Pro Text 11 pt (Regular and Bold),
taken with GTK4. "Ink" is the mean darkness, and edgeY/edgeX are the mean
pixel gradients (edge sharpness):

| Variant | ink | edgeY | edgeX |
|---|---|---|---|
| automatic (slight → autohinter) | 30.64 | 20.59 | 27.92 |
| manual medium + metric hinting | 29.62 | 19.75 | 26.94 |
| manual medium, no metric hinting, `n` (natural) | 30.63 | 20.76 | 27.89 |
| same, `q` (balanced) | 30.83 | 20.65 | 27.64 |

At UI sizes, `q` and `n` look almost the same. Metric hinting costs a little
weight and sharpness and makes spacing uneven, so it stays off.

**Dots and diaereses decide it.** The test counts glyphs whose dot or diaeresis
touches the letter body, meaning no pixel row below 25% coverage separates them.
It uses FreeType NORMAL (bytecode) on
`i j ï ä ö ü ϊ ë` × Regular/Medium/Semibold/Bold/Heavy, 40 cases per size.
Every variant was built the same way, with the PKGBUILD's flags:

| stem mode | 10px | 11px | 12px | 13px | 14px | 15px | 16px |
|---|---|---|---|---|---|---|---|
| `q` balanced (default) | 0 | 1 | 1 | 0 | 0 | 2 | 2 |
| `n` natural | **12** | **21** | **8** | 0 | 1 | 1 | 4 |
| `s` sharp | 2 | 8 | 1 | 0 | 0 | 0 | 0 |
| *(slight/autohinter, for reference)* | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

The failures are mostly Semibold/Bold/Heavy. `natural` visibly glues the dots
at 10–12 px (≈ 7.5–9 pt at 96 dpi: captions, small labels, panel text).
**Keep the default `balanced` preset.** `sharp` helps a little at 14–16 px but
is worse at 10–11 px.

For Inter the ranking is different: its `sharp` default closes 0 of 224 at
10–13 px. See `ttf-inter-hinted/PKGBUILD`.

### 9. Firefox: uneven letter spacing at hintmedium

Firefox bypasses pango/GTK text rendering. It reads hinting from the
fontconfig pattern and renders through Skia/WebRender. In
`gfx/2d/ScaledFontFontconfig.cpp` (`UseSubpixelPosition`) and
`gfx/thebes/gfxFT2FontBase.cpp` (`ShouldRoundXOffset`, `GetFTGlyphExtents`),
subpixel positioning is allowed **only for hintstyle none or slight**. At
medium/full, Firefox:

- rounds every glyph position to a whole pixel, and
- takes the advance from `glyph->advance.x`, the hinted value rounded to an
  integer, instead of `linearHoriAdvance`.

The result is the uneven gaps GTK4 shows with metric hinting on. For example,
"Hamburgefonstiv Αλφάβητο 0123" in SF Pro Text at 13 px is 241.92 px unhinted
but 240.00 px hinted. The fix keeps the bytecode hinting and restores exact advances:

```js
// user.js in the profile (read once at startup, so restart Firefox)
user_pref("gfx.text.subpixel-position.force-enabled", true);
```

With the pref on, `ShouldRoundXOffset()` returns false. Firefox then uses
`linearHoriAdvance` and places glyphs at subpixel positions, while the glyph
outlines are still hinted by the font's bytecode (vertical snapping). This is the
same combination as GTK4 manual mode with `gtk-hint-font-metrics=false`.
Web content follows fontconfig's `sans-serif`, the browser UI the GTK font, so
both Inter and SF Pro Text are affected. Chrome has the same problem at
hintmedium but no pref to fix it; see §10.

Verified 2026-09-29 on Firefox Nightly: with the pref on, the uneven gaps are gone.

### 10. Chromium and Electron: keep them on hintslight

Earlier notes said Chrome "keeps subpixel positioning at hintmedium". That is
true for glyph *positions* but not for *advances*. Measured 2026-09-30 with
headless Chrome, SF Pro Text, 54 characters, JS `getBoundingClientRect()` per
glyph:

| fontconfig hintstyle | fractional advances | 16 px Bold line |
|---|---|---|
| hintnone / hintslight | 49/54 | 468.8 px |
| **hintmedium** | **0/54** | 475.0 px (+1.3 %, uneven gaps) |

Why, from source:

- `ui/gfx/font_render_params_linux.cc`: `subpixel_positioning = device_scale_factor > 1`.
  The renderer's `use_subpixel_positioning` comes from the same call
  (`renderer_preferences_util.cc`).
- `blink/.../web_font_render_style.cc`: `setSubpixel(true)` unless hintfull, but
  `setLinearMetrics(use_subpixel_positioning == 1)`, so linear metrics are off at scale 1.
- `SkFontHost_FreeType.cpp`: linear metrics are forced only for kNone/kSlight.
  At kNormal (hintmedium) the advance is the hinted, whole-pixel `advance.x`.

No command-line switch changes this. Only `--disable-font-subpixel-positioning`
exists, and `--force-device-scale-factor` > 1 also sets `hinting = NONE`.
The fix is a fontconfig `prgname` rule. prgname is the executable's basename
(`/opt/google/chrome/chrome` → `chrome`). The shipped snippet leaves those
programs out of its hintmedium edit:

```xml
<test qual="all" name="prgname" compare="not_eq"><string>chrome</string></test>
```

`qual="all"` makes the test pass when prgname is unset. If hintmedium is your
*global* default, also add a per-app `hintslight` rule after it:

```xml
<match target="font">
  <test name="prgname" compare="eq"><string>chrome</string></test>
  <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
</match>
```

Verified: with the rule, Chrome and Chromium report 49/54 fractional advances again.

### 11. Tracking: Apple's `trak` table needs STAT

SF Pro Text/Display/Rounded and New York ship an AAT `trak` table: Apple's
size-specific letter-spacing, e.g. SF Pro Text +12/2048 em at 11pt, 0 at 12pt,
−47 at 17pt. SF Mono has none. HarfBuzz applies `trak` only when the font also
has a STAT table (`hb-ot-shape.cc`: `apply_trak = has_tracking && STAT->has_data()`),
and Apple's static fonts have no STAT. `add_stat.py` (build option `TRACKING`,
default on) adds a minimal one: a wght and an ital axis describing what the
font already is. fontconfig's family/style/weight are unchanged.

pango, SF Pro Text Regular, "Hamburgefonstiv Αλφάβητο ελληνικά":

| pt | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 17 | 20 |
|---|---|---|---|---|---|---|---|---|---|
| width change | +4.3 % | +0.9 % | +0.8 % | 0 | −1.0 % | −2.7 % | −1.4 % | −4.0 % | −5.9 % |

pango passes HarfBuzz the size in points. Chrome passes CSS px as points,
like Safari, so 16 px web text gets the 16pt track (−3.9 % measured). STAT and
`trak` survive otf2ttf and ttfautohint. font-patcher (FontForge) drops both, so
`NERD_PATCH=true` builds get no tracking.

### 12. Other variants measured and rejected (2026-09-30)

FreeType simulation, 4 weights (Regular…Bold) × 8 sizes (12–20 px), glyphs
placed at quarter-pixel x like GSK. "glued" = dot/diaeresis with no row under
25 % coverage between it and the body (`i j ï ä ö ü ϊ ϋ ë ΐ ΰ`). "height" =
flat and round letters disagree on x-height (Latin, Greek), cap height or
baseline.

| mode | glued | height mismatches | ink vs outline |
|---|---|---|---|
| none | 65 | 27 | 1.000 |
| slight (autohinter) | 47 | 0 | 1.015 |
| **medium (package bytecode)** | **2** | **0** | 1.003 |
| full + `autohint=true` | 33 | 0 | 1.025 |
| slight + `autofitter:no-stem-darkening=0` | 72 | 0 | 1.075 |

- **slight fails at 9 pt Bold.** All 11 diacritics merge into the letter.
  The real GTK4 render shows the same. medium keeps a clean gap.
  At 11 pt the two are almost identical.
- **`manual` + slight is pixel-identical to `automatic`.** Diff 0.000 on a real
  GSK render, so `font-rendering manual` does nothing unless `font-hinting` is
  medium/full.
- **Stem darkening** only runs in the autohinter's light mode. It darkens by
  about 7 % and glues more dots ("illicit" → "IIIIcIt" at Bold 9 pt).
- **`GDK_DEBUG=linear`** (linear blending, which FreeType asks for with stem
  darkening) makes dark-on-light text much lighter: GSK ink 13.1 with darkening,
  11.8 without, vs 17.9 by default. Rejected either way.

## Verifying on your own system

1. **Effective GTK4 settings:** see the Python snippet in §4.
2. **Which file fontconfig matches, with which options:**
   ```sh
   fc-match -v "SF Pro Text:pixelsize=14.6667" file hinting hintstyle autohint antialias rgba
   ```
   Expect the `/usr/share/fonts/apple/...ttf` file, `hintstyle: 2` (medium) and `autohint: False`.
3. **Does a load mode run the bytecode?** Compare bitmap hashes per load mode,
   as in §3. The core of the test program (build it with
   `gcc -include stdlib.h ftcmp.c $(pkg-config --cflags --libs freetype2)`):
   ```c
   FT_Set_Pixel_Sizes(face, 0, ppem);
   for each char: FT_Load_Glyph(face, FT_Get_Char_Index(face, c), flags);
                  FT_Render_Glyph(face->glyph, FT_RENDER_MODE_NORMAL);
                  hash bitmap_left, bitmap_top and every bitmap byte
   ```
   If `TARGET_LIGHT` hashes the same as `TARGET_LIGHT | FORCE_AUTOHINT`, the
   autohinter is in use. If `TARGET_NORMAL` hashes the same as
   `TARGET_NORMAL | NO_AUTOHINT`, the font's bytecode is in use.
4. **Real GTK4 rendering:** render a `Gtk.Label` offscreen with
   `Gtk.WidgetPaintable` → `Gtk.Snapshot` → `win.get_renderer().render_texture()`.
   To compare automatic and manual mode in one process, set
   `gtk-font-rendering` and `gtk-hint-font-metrics` on `Gtk.Settings.get_default()`.

### Pitfalls met during testing

- **Test fonts must have a unique family name.** A `ttfautohint --dehint` copy
  keeps the family name "SF Pro Text". When its directory is added through a
  custom `FONTCONFIG_FILE`, it can shadow the installed font, so you end up
  comparing *unhinted* output without noticing. Always check with `fc-match ... file`,
  and give rebuilt test fonts a suffix (`ttfautohint -F " test"`).
- `ttfautohint -w` is the deprecated `--strong-stem-width` option, not the stem
  mode. Use `-a` / `--stem-width-mode`. The PKGBUILD already does.
- Offscreen cairo tests without GTK are misleading for metrics-off modes. The
  baseline lands on fractional pixels and blurs horizontal edges, while GSK
  rounds it.
- **fontconfig 2.18 still loads `$XDG_CONFIG_HOME/fontconfig/` when
  `FONTCONFIG_FILE` is set.** An "isolated" test config is silently overridden by
  your own `fonts.conf`. Set `XDG_CONFIG_HOME` to an empty directory as well.
  `FC_DEBUG=4` also prints "Add Rule" lines for files that are only *scanned*
  (e.g. every `conf.avail` entry), so the trace alone does not show which rules are active.
- Comparing RGBA screenshots with `ImageChops.difference(...).getbbox()` only
  looks at the alpha channel. Composite onto white and compare the grey values.

---

## Sources

- GTK source 4.22.5: `gtk/gtkwidget.c`, `gtk/gtksettings.c`, `gdk/wayland/gdksettings-wayland.c`
- cairo source 1.18.4: `src/cairo-ft-font.c` (`_cairo_ft_options_merge`)
- [GTK blog – On fractional scales, fonts and hinting](https://blog.gtk.org/2024/03/07/on-fractional-scales-fonts-and-hinting/)
- [Gtk.Settings:gtk-font-rendering](https://docs.gtk.org/gtk4/property.Settings.gtk-font-rendering.html)
- [FreeType – On slight hinting, proper text rendering, stem darkening and LCD filters](https://freetype.org/freetype2/docs/hinting/text-rendering-general.html)
- [FreeType driver properties](http://freetype.org/freetype2/docs/reference/ft2-properties.html)
- [ArchWiki – Font configuration](https://wiki.archlinux.org/title/Font_configuration)
