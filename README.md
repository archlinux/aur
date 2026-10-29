# ttf-geologica-hinted

[Geologica](https://fonts.google.com/specimen/Geologica) 1.010 by Monokrom
(Sindre Bremnes, Frode Helland), hinted with ttfautohint for FreeType,
optionally cut into static fonts and Nerd Fonts patched, plus fontconfig family
names for its Sharp and Cursive axes. Build options are documented in the
header of `PKGBUILD`; the full axis and OpenType feature reference is in
`FEATURES.md`.

This file covers **what the package changes, why, and whether Geologica reacts
to the usual Linux font settings like its siblings**. It assumes the rendering
pipeline explanation in `ttf-inter-hinted/README.md` (GTK4 → pango → cairo →
FreeType) and the verification methods in `ttf-roboto-flex-hinted/README.md`.

Measured on 2026-10-26: GNOME on Wayland with `font-rendering=manual`,
`font-hinting=slight`, grayscale antialiasing and `gtk-hint-font-metrics=false`;
GTK 4.24.1, pango 1.58.2, cairo 1.18.6, HarfBuzz 14.6.0, FreeType 2.15.0,
fontconfig 2.18.3, fontTools 4.67.0, ttfautohint 1.8.4.

---

## What upstream ships, and what this package adds

Upstream (`github.com/googlefonts/geologica`) is **archived** and has no
releases. Its `main` is a single commit, `685f38d7`, which is exactly what
Google Fonts took: `fonts/variable/Geologica[CRSV,SHRP,slnt,wght].ttf`,
byte-identical in both places (sha256 `9124d9e8…59ec`). This package pins that
commit, so the source cannot move.

That file is **unhinted**: no `fpgm`, no `cvt`, zero glyph instructions, and a
7-byte `prep`. The static files in the same repository (`fonts/ttf/`) are
unhinted in practice too – gftools' `fix-hinting` left them a `cvt`/`fpgm` and
a ttfautohint version string, but still zero glyph instructions.

| | upstream / Google Fonts | this package |
|---|---|---|
| Hinting | none → at `hintmedium` FreeType snaps nothing (measured identical to `NO_HINTING`); at `hintslight` its light autohinter | ttfautohint bytecode, preset `natural` (measured best) |
| Static fonts, per-weight hinting | `fonts/ttf/` only, unhinted, SHRP 0 | `GEO_VARIANT=static`: any of the nine weights, italic, SHRP 0 or 100, each hinted on its own |
| Axis names in GTK/pango | `@SHRP=100`, `@CRSV=1` only | opt-in `79-geologica-families.conf`: `Geologica Sharp`, `Geologica Semi Sharp`, `Geologica Cursive` |
| Thin (or ExtraLight/Light) as the desktop font | impossible: GTK drops the weight from `font-name` | `GEO_UI_WEIGHT=100`: a second family, `Geologica UI`, whose Regular draws Thin (section 1.4) |
| Cursive a/g in browsers and Electron without page CSS | impossible: they ignore fontconfig `fontfeatures` | `GEO_UI_FEATURES=ss01` on `Geologica UI` (section 1.5) |
| Nerd Fonts | – | `NERD_PATCH=true` |
| Docs | README of the sources | this README, `FEATURES.md` in `/usr/share/doc/ttf-geologica-hinted/` |

Files installed (default build):

```
/usr/share/fonts/geologica/GeologicaVariable.ttf
/usr/share/fonts/geologica/GeologicaUIVariable.ttf          (GEO_UI_WEIGHT only)
/usr/share/fontconfig/conf.avail/79-geologica-families.conf   (opt-in)
/usr/share/fontconfig/conf.avail/80-ttf-geologica-hinted.conf (opt-in)
/usr/share/doc/ttf-geologica-hinted/{README,FEATURES}.md
```

Nothing is enabled by default. Unlike `ttf-roboto-flex-hinted` there is **no
fontconfig fix that has to be on**: Geologica's weights and italics already
work (section 1).

---

## TL;DR — recommended settings

| Where | Setting | Why |
|---|---|---|
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'`, `font-hinting 'slight'`, `font-antialiasing 'grayscale'` | `hintslight` is what renders Geologica best: the light autohinter re-derives its blue zones for the instance being drawn and leaves stems alone (section 2) |
| fontconfig | **no** `80-ttf-geologica-hinted.conf` | the bytecode is only for desktops on `hintmedium`; at `slight` it is ignored, and the autohinter measures equal at 400-700 and clearly better at 900 |
| `~/.config/environment.d/90-freetype.conf` | `FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0"` | optional: +16% ink on Geologica Thin, +7% on Regular, so hairlines and stems stay even (section 2.6) |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | whole-pixel advances give uneven letter gaps |
| `/etc/fonts/conf.d/` | leave `10-hinting-slight.conf` (the Arch default) enabled | |
| fontconfig, optional | symlink `79-geologica-families.conf` | family names for the sharpness and cursive axes (section 3) |
| gsettings `font-name`, for a light desktop font | `'Geologica UI 11'` (build with `GEO_UI_WEIGHT=100`), **not** `'Geologica Thin 11'` | GTK3/GTK4 keep only family and size from `font-name`, so the Thin request renders at 400 (section 1.4) |
| CSS in browsers | `font-variation-settings: "SHRP" 100` for sharpness; `font-feature-settings: "ss01"` for the cursive a/g | browsers map `italic` to `slnt` but cannot set `CRSV` (section 1.3) |

On a desktop that runs `hintmedium`/`hintfull` globally, do the opposite: link
the 80- snippet so Geologica gets its bytecode instead of rendering unhinted,
and keep `gtk-hint-font-metrics=false`.

```sh
# the recommended setup, if your desktop is not there already
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting slight
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
mkdir -p ~/.config/environment.d
cat > ~/.config/environment.d/90-freetype.conf <<'EOF'
FREETYPE_PROPERTIES="truetype:interpreter-version=40 autofitter:no-stem-darkening=0"
EOF
# log out and back in; check with:
tr '\0' '\n' < /proc/$(pgrep -xu $USER gnome-shell)/environ | grep FREETYPE
```

---

## 1. The four axes, the Thin default, and what pango does with them

| Tag | Name | Min | Default | Max | What it does |
|---|---|---|---|---|---|
| `wght` | Weight | 100 | **100** | 900 | Thin … Black. Line width +7.2% at 900 vs 400 |
| `SHRP` | Sharpness | 0 | 0 | 100 | Terminal treatment and inner points. Ascenders/descenders +40/2000 em, x-height unchanged, line width -0.2% |
| `CRSV` | Cursive | 0 | 0 | 1 | Substitutes cursive `a g` (and the accented `a` forms) through `rvrn`. Line width +0.8% |
| `slnt` | Slant | -12 | 0 | 0 | Oblique, sheared outline (-12° = the designed italic). Line width +0.4% (roman forms) |

18 named instances: the nine weights upright and italic. The italic instance
is `CRSV=1, slnt=-12`; there is no separate italic file.

**The default weight is Thin**, not Regular: `fvar` says `wght` default 100,
the name table says "Geologica Thin", and `OS/2.usWeightClass` is 100. This is
the single most important difference from the sibling packages, and it has
three separate consequences.

### 1.1 pango and browsers do not render Thin by accident

fontconfig exposes all 18 named instances as styles of the family `Geologica`,
and `fc-match Geologica` answers `style=Regular`. But the file is one face with
`wght` default 100, so the question is whether the client applies the weight
itself:

| Request | Rendered as | Result |
|---|---|---|
| `Geologica 12` | pixel-identical to `Geologica 12 @wght=400` | correct |
| `Geologica Bold 12` | identical to `@wght=700` | correct |
| `Geologica Thin 12` | identical to `@wght=100` | correct |
| `Geologica Italic 72` | identical to `@slnt=-12,CRSV=1`; `l` at 11.96° | correct, and **no double slant** |

pango derives `wght` from the requested weight, and for the italic it applies
the whole named instance (slant **and** cursive). Nothing leaks the Thin
default into applications, so this package does **not** re-default the font to
400 – which is lucky, because the Thin master is the better hinting source
(section 2.5).

Browsers: `font-weight` and `font-style: italic` work the same way (`wght`,
`slnt`), but CSS has no `CRSV`, so *italic in a browser is the mechanical
oblique* – slanted, roman `a g`. The font's `ss01` feature performs exactly
the same substitution as `CRSV=1` (verified pixel-identical in pango), so

```css
.geo-italic { font-style: italic; font-feature-settings: "ss01"; }
```

gives the designed italic in Firefox and Chromium too.

### 1.2 The x-height moves with the weight

Measured with HarfBuzz at 2000 upem, glyph extents:

| | Thin 100 | Regular 400 | Bold 700 | Black 900 |
|---|---|---|---|---|
| x-height (`x`) | 960 | 990 | 1020 | 1040 |
| round overshoot (`o` top) | 990 | 1020 | 1050 | 1070 |
| cap height (`H`) | 1400 | 1400 | 1400 | 1400 |
| ascender (`b`) | 1440 | 1440 | 1440 | 1440 |
| descender (`g` bottom) | -1440 | -1470 | -1500 | -1520 |

The x-height grows by 80 units (8% of the x-height) from Thin to Black, while
cap height, ascender and baseline are constant. `SHRP=100` leaves x-height and
cap height alone but pushes ascenders and descenders 40 units further
(`b` 1440 → 1480, `g` -1470 → -1498) and changes `g`'s shape.

ttfautohint writes **one** set of blue zones, taken from the default master.
For Geologica that is the Thin master, so the zones are 30-80 units below the
heights the heavier instances actually have. This is measured in section 2.

### 1.3 Line metrics

`hhea` and `OS/2` typo metrics are 1950/-550/0, the `fsSelection` USE_TYPO_
METRICS bit is set, so the default line height is 1.25 em everywhere and the
weight axis does not change it. `usWinAscent/Descent` are 2518/895 (Windows).

### 1.4 A light desktop font: `Geologica UI` (`GEO_UI_WEIGHT`)

`gsettings set org.gnome.desktop.interface font-name 'Geologica Thin 11'` does
**not** give a Thin desktop. pango renders `Geologica Thin 11` correctly, but
GTK3 and GTK4 take only family and size from `font-name` and the weight from
CSS: a label's font description is `Geologica 11` (checked in both toolkits),
so pango sends `wght=400`. GNOME Shell keeps the weight; the applications do
not.

Changing `OS/2.usWeightClass` (what `fix_weights.py` does for MiSans) cannot
help, because fontconfig already picks the right face here; the problem is the
axis value. A fontconfig rule can force `fontvariations wght=100`, but only
pango reads it, and a rule on `Geologica` itself takes Regular away from every
other program.

`GEO_UI_WEIGHT=N` installs a second copy of the variable font,
`GeologicaUIVariable.ttf`, family **`Geologica UI`**, with an `avar` table that
maps the requested weight to the drawn one (user → design):

| requested | 100 | 300 | **400** | 500 | 600 | **700** | 900 |
|---|---|---|---|---|---|---|---|
| `GEO_UI_WEIGHT=100` | 100 | 100 | **100** | 300 | 500 | **700** | 900 |
| `GEO_UI_WEIGHT=300` | 100 | 233 | **300** | 433 | 567 | **700** | 900 |

Regular draws `N`, Bold stays Bold (headings and bold labels keep their
contrast), and the italic follows the weight. Because the mapping is inside the
font, every renderer applies it – pango, Firefox, Chromium, Qt – and no
fontconfig rule is needed. Plain `Geologica` is untouched, so editors and
documents keep all nine weights. Measured with `pango-view`, 24 px, ink sum:

| request | ink |
|---|---|
| `Geologica 24` (Regular) | 864 |
| `Geologica Thin 24` | 497 |
| `Geologica UI 24` (`GEO_UI_WEIGHT=100`) | 498 |
| `Geologica UI Medium 24` | 738 (= Light) |
| `Geologica UI Bold 24` | 1249 (`Geologica Bold`: 1262) |

```sh
GEO_UI_WEIGHT=100 makepkg -si
gsettings set org.gnome.desktop.interface font-name 'Geologica UI 11'
# ~/.config/gtk-3.0/settings.ini and gtk-4.0/settings.ini, if you keep them:
#   gtk-font-name=Geologica UI 11
```

The family name may not end in a pango style word (`Thin`, `Light`, `Bold`,
`Italic`, `Condensed`, …): pango would parse it as a style, which is exactly
how `Geologica Thin 11` lost its weight. `make_ui.py` refuses such names.

### 1.5 Chromium, Electron and fontconfig features (`GEO_UI_FEATURES`)

Chromium-based browsers (Chromium, Brave, Chrome, Vivaldi, Helium) and
Electron apps take from fontconfig **only**:

- family matching and aliases: the default fonts in `chrome://settings/fonts`,
  generic `sans-serif`/`monospace`, and the fallback for missing glyphs;
- the rendering settings per font: `antialias`, `hinting`, `hintstyle`,
  `rgba`, `lcdfilter`, `autohint`, `embeddedbitmap`.

They ignore `fontfeatures` and `fontvariations` edits. HarfBuzz in Blink
shapes with the page's CSS only (`font-feature-settings`,
`font-variation-settings`). Firefox and Qt do the same; pango is the only
consumer of those two fontconfig properties. Measured in headless Chromium
with `font-family: Geologica` and a fontconfig rule adding `ss01`: the a/g
stay double-storey. They change only with `font-feature-settings: "ss01"` in
the page.

A browser's default font also only applies where a page does not set its own,
which most sites do.

What still reaches every program is what is **inside the font file**. That is
why `Geologica UI` shifts its weights with `avar` (Chromium renders
`font-weight: 400` exactly like `Geologica` at 300 when `GEO_UI_WEIGHT=300`,
measured). `GEO_UI_FEATURES=ss01` does the same for the cursive a/g: the
`ss01` lookups are appended to `calt`, which every shaper applies by default.

| headless Chromium, no page CSS | a/g |
|---|---|
| `Geologica UI` built without features | double-storey |
| `Geologica UI` with `GEO_UI_FEATURES=ss01` | cursive; pixel-identical to the first with `font-feature-settings: "ss01"` |
| the same, with `font-feature-settings: "calt" 0` | double-storey again |

They join `calt`, not `ccmp`/`rvrn`: those run in an earlier HarfBuzz stage
and would replace `a` before `sups`/`ordn`/`frac` look for it. The cmap is
untouched. Only `Geologica UI` is changed; `Geologica` stays as designed.

---

## 2. Hinting: what the bytecode does to Geologica

Method (`measure.py`, same as the sibling packages, so the numbers are
comparable): FreeType 2.15.0 through freetype-py, glyphs on an integer origin,
the variable font set to the weight under test. 10-20 px for the dot metric,
12/13/14/16 px for the deviation.

- **glued** – `i j ï ä ö ü ë ё ϊ ϋ ΐ ΰ` where no pixel row below 25% coverage
  separates the mark from the letter body. 165 cases per weight, fewer is
  better.
- **deviation** – summed coverage difference from an 8× supersampled unhinted
  render of "Hamburgefonstiv Αλφάβητο 0123", in % of its ink, at the best
  1/8-px alignment. Lower = closer to the designed outline.

### 2.1 Dots and diaereses (glued, 10-20 px)

| Build | Thin 100 | Regular 400 | Bold 700 | Black 900 |
|---|---|---|---|---|
| unhinted (= upstream at `hintmedium`) | 8 | 25 | 44 | 74 |
| `hintslight` (FreeType's light autohinter) | **0** | **2** | **7** | **0** |
| bytecode `natural` (n, **default**) | 0 | 5 | 18 | 22 |
| bytecode `balanced` (q) | 0 | 5 | 14 | 10 |
| bytecode `sharp` (s) | 0 | 0 | 18 | 22 |
| static build, `natural`, hinted per weight | 0 | 4 | 6 | 8 |

Geologica's dots merge **by design** at heavy weights: unhinted Black glues 74
of 165 cases. The light autohinter separates almost all of them, the bytecode
separates most. At Regular the autohinter is best too, which is the opposite
of what was measured for Roboto Flex – there the autohinter glued `ä ö ü` and
`ttfautohint -a q` was the winner. Geologica's marks sit further from the body,
so there is nothing to repair.

### 2.2 Deviation from the outline (12/13/14/16 px)

| Build | Thin 100 | Regular 400 | Bold 700 | Black 900 |
|---|---|---|---|---|
| unhinted | 3.5 | 0.8 | 1.4 | 1.1 |
| `hintslight` (autohinter) | 12.3 | **12.1** | 10.7 | **7.5** |
| bytecode `natural` (**default**) | **12.5** | **11.6** | 10.7 | 10.6 |
| bytecode `balanced` | 13.6 | 14.7 | 11.2 | 11.0 |
| bytecode `sharp` | 21.9 | 12.7 | 11.6 | 11.4 |
| static, `natural`, per-weight | **11.7** | 11.5 | **10.2** | **7.5** |

Reading:

- `natural` is the only bytecode preset that is safe across the whole axis.
  `sharp` and `balanced` add 14 units of x-height on top of snapping stems,
  which wrecks Geologica Thin (21.9 / 13.6): its hairlines are one pixel wide,
  so a 0.2 px shift is a visible weight change.
- Between 100 and 400 the bytecode and the autohinter are within 0.4 of each
  other. They disagree at 700-900, and the reason is visible in the blue
  zones: the bytecode's are the Thin master's, the instance's x-height is 30-80
  units higher.
- The static build proves it. Hinted per weight it measures 7.5 at Black -
  exactly the autohinter's number, and 3.1 better than the variable font. The
  gap is the zone mismatch, not the hinting engine.
- That is the reason `GEO_VARIANT=static` exists, and why the default preset
  for the variable font has no x-height boost: any boost is applied to all
  nine weights, and Thin is the one that cannot take it.

### 2.3 What the bytecode does to vertical positions

Mean (hinted - unhinted) y of the topmost outline point of `x o H`, in px
(negative = snapped downwards):

| wght | 12 px | 13 px | 14 px | 16 px |
|---|---|---|---|---|
| 100 bytecode / slight | -0.04 / -0.04 | +0.74 / +0.74 | +0.18 / +0.18 | +0.06 / +0.06 |
| 400 bytecode / slight | -0.16 / -0.16 | +0.61 / +0.61 | +0.04 / +0.04 | -0.09 / -0.09 |
| 700 bytecode / slight | -0.28 / -0.28 | +0.48 / +0.15 | -0.09 / -0.43 | -0.26 / +0.74 |
| 900 bytecode / slight | -0.35 / +0.65 | +0.40 / +0.06 | -0.19 / +0.48 | -0.36 / +0.64 |

At Thin and Regular the two renderers snap identically (which is why the
deviation is the same there). At Bold and Black they part by up to a pixel:
the autohinter's blue zones are the instance's, the bytecode keeps Thin's and
snaps downwards. Neither is "right" at every size - a top at 7.28 px is one
pixel away from either 7 or 8 - but a hinting system that only knows the Thin
master can never follow the weight axis, and that is the deviation
difference above.

### 2.4 Does it matter in practice?

At 400-700 the difference between the autohinter (12.1 / 10.7) and the
bytecode (11.6 / 10.7) is below what the eye resolves at 12-16 px. Both snap
baseline, x-height and cap height, both keep the dots apart, and the measured
`height` metric (flat vs round letters disagreeing on x-height or cap height)
is 0 for every hinted row. What remains is which pixel a given height lands
on, and that differs per size and per weight, in both directions.

So: if your desktop is on `hintslight` (the Arch default), do nothing - that
is FreeType's autohinter, the best column of the tables above. If it is on
`hintmedium`, the 80- snippet gives you a render that is much better than
unhinted and roughly equal to the autohinter at 400-700; at 700-900 the
static build is the best of both, at the cost of the axes.

### 2.5 Why the variable font is not re-defaulted to Regular

Re-defaulting `wght=400` (fontTools instancer, `wght=100:400:900`) and then
hinting gives 14.3 / 12.1 / 10.6 / 10.4 – worse at Thin (14.3 vs 12.5) and
only marginally better at 700-900. The Thin end is the sensitive one (hairline
strokes), so the package keeps upstream's default and documents it instead.

Where it shows: with a Regular default the per-size deviation at wght 400
(8-13 px: 9.7 / 12.9 / 10.6 / 10.1 / 16.4 / 10.6) is the autohinter's
(9.7 / 12.9 / 10.4 / 11.2 / 16.5 / 10.6) to the decimal – at Regular weight
the bytecode and the light autohinter agree, because the blue zones agree.
With upstream's Thin default the same run gives 10.3 / 13.2 / 11.3 / 12.7 /
13.6 / 11.4: up to 2.4 points of extra deviation, and the price is paid by
every weight above Regular.

### 2.6 Stem darkening (autohinter only)

`FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0"`, ink of the test string
at 11-16 px and deviation:

| | Thin 100 ink | Thin dev | Regular 400 ink | Regular dev |
|---|---|---|---|---|
| off (the Arch default) | 396.7 | 15.9 | 675.9 | 12.5 |
| on | 461.1 (+16%) | 29.5 | 723.1 (+7%) | 16.3 |

The deviation counts the deliberately added weight, so ignore it here; what
matters is that Geologica Thin and ExtraLight gain 16% ink, which is what
makes 100-200 weights usable at 11-12 px on a grayscale LCD. It has no effect
on the bytecode (that is the native hinter), which is one more reason the
`slight` setup is the better one for this font.

### 2.7 Hinting the other axes

Bytecode `natural`, wght 400, 12/13/14/16 px, deviation:

| | SHRP=0 | SHRP=100 | CRSV=1 | slnt=-12, CRSV=1 |
|---|---|---|---|---|
| bytecode | 11.6 | 12.2 | 11.6 | 12.1 |
| `hintslight` | 12.1 | 12.1 | – | 12.8 |

No `height` mismatches and no glued dots beyond the SHRP=0 case in 10-20 px.
The 40-unit ascender shift at `SHRP=100` is smaller than one pixel at every
size below 30 px, and the cursive substitution only replaces `a g`, whose
heights are unchanged. Hints survive all four axes; only the *weight* axis is
a real problem for the variable bytecode.

### 2.8 `head.flags` bit 3 (integer ppem)

ttfautohint leaves bit 3 of `head.flags` clear; fontbakery fails hinted fonts
for it, because Windows GDI needs whole-pixel ppem. On Linux it is not
cosmetic: with the bit set, FreeType rounds a fractional size up to the next
whole pixel, measured on this font as +19% ink at 8 pt and +16% at 11 pt
(96 dpi) – i.e. text gets bigger and line breaks move. The option
`HINT_INTEGER_PPEM=true` sets it for people who match Windows; the default
leaves it off.

---

## 3. Family names for the Sharp and Cursive axes (`79-geologica-families.conf`)

Opt-in, variable build only. Same mechanism as the Roboto Flex width presets:
a `target="pattern"` rule renames the request and appends `fontvariations`,
which pango applies on top of its own `wght`/`slnt`/`CRSV`.

| Name | Equivalent |
|---|---|
| `Geologica Sharp` | `@SHRP=100` |
| `Geologica Semi Sharp` | `@SHRP=50` |
| `Geologica Cursive` | `@CRSV=1` (upright cursive `a g`; same as `ss01`) |

They combine with weight, italic and size (`Geologica Semi Sharp Bold Italic
11` = SHRP=50, wght=700, slnt=-12, CRSV=1), do not appear in font pickers, and
are read by pango only – Firefox and Chromium ignore fontconfig variations; use
CSS there. Writing your own: copy one `<match>` into
`~/.config/fontconfig/fonts.conf`, change the name and the variation string.

---

## 4. Verifying on your own system

```sh
# 1. which file, and is it hinted?
fc-match -v 'Geologica' file fonthashint
#   upstream font: fonthashint False     this package: True

# 2. weight: "Geologica 12" must be Regular, not Thin (the font's default!)
pango-view --no-display --pixels --margin=0 --font='Geologica 72' -t a -o /tmp/a.png
pango-view --no-display --pixels --margin=0 --font='Geologica 72 @wght=400' -t a -o /tmp/b.png
cmp /tmp/a.png /tmp/b.png && echo same

# 3. italic: 12 degrees, not 0 (pango would lose slnt) and not 24 (double slant)
pango-view --no-display --pixels --margin=0 --font='Geologica Italic 72' -t l -o /tmp/l.png

# 4. the presets, once 79-… is enabled
fc-match 'Geologica Sharp:bold:italic' --format='%{family[0]} %{fontvariations}\n'
#   Geologica SHRP=100

# 5. Chromium stays on hintslight (prgname is the executable's basename)
cp /usr/bin/fc-match /tmp/chrome
/tmp/chrome 'Geologica:pixelsize=16' --format='%{hintstyle}\n'   # 1
```

Re-run the measurements with `measure.py`:

```sh
python measure.py GeologicaVariable.ttf medium '{"wght":900}' 12,13,14,16
python measure.py Geologica-Regular.ttf slight '{}' 10,11,12
```

### Pitfalls met here

- **freetype-py ships its own libfreetype** (2.13.2 in this environment), while
  pango/cairo use the system one (2.15.0). Copy the package somewhere, delete
  `freetype/libfreetype.so` and put the copy first in `PYTHONPATH`, otherwise
  you measure the wrong hinter. `freetype.version()` tells you which one you
  got.
- **`pango-view` without `FONTCONFIG_FILE` tests the installed font**, not the
  file in your build directory. Use a small config with
  `<dir>/path/to/build</dir>` plus `<include>/etc/fonts/conf.d</include>` and
  export `FONTCONFIG_FILE`.
- **`@ss01=1` in a font description is silently ignored** – pango parses it as
  an axis name, and there is no such axis. Features go through fontconfig
  `fontfeatures`, pango markup `font_features`, or `HarfBuzz`; the equivalent
  axis is `@CRSV=1`.
- Comparison renders must use the same size, otherwise pango applies a
  different `wght`/`slnt` derivation and you compare different faces.
- The `deviation` metric is very sensitive at Thin weights: a 0.5 px vertical
  shift is a 16% ink change on a one-pixel stem. Read the Thin column as "did
  the hinting move the outline", not as "how ugly is it".
- `fc-match` reports `style=Regular` for the variable font by matching the
  named instance, while the file's own default is Thin. Both are true; only a
  render tells you what an application does.

---

## 5. Features in apps that ignore fontconfig (`FEATURE_DEFAULTS`)

fontconfig's `fontfeatures` is read by pango/GTK only: Chromium, Electron, Qt
and LibreOffice shape text without it, and in a browser only the page CSS can
ask for a feature. A font cannot declare one "on by default" either - a shaper
applies a fixed list (`ccmp locl mark mkmk kern calt liga clig rlig`). So the
only way to make a feature the default everywhere is to move its lookups into
one of those features, which is what `make_features.py` does and what
`FEATURE_DEFAULTS` runs as the last build step:

```sh
FEATURE_DEFAULTS=ss01 makepkg -si     # cursive a/g in every app, Chrome included
```

`makepkg` asks for this during the build: Enter bakes nothing, so a plain build
is unchanged. `FEATURE_FAMILY` is not prompted for on purpose - it renames every
file to one family, which would merge the cuts a multi-family build installs -
so the variables below are what an unattended build, or a renamed copy, uses.

`ss01` is the cursive `a` and `g` (42 glyphs, the same substitution the `CRSV`
axis performs). The Geologica block in `~/.config/fontconfig/fonts.conf`
already turns it on for pango, so baking it is what makes Chrome, Electron, Qt
and LibreOffice show the same thing with no CSS and no config. It is the same
result `GEO_UI_FEATURES=ss01` gives to the *Geologica UI* copy, except that it
applies to whatever this build installs: the variable font, the statics, or a
Nerd Fonts build.

| tag | effect | bake? |
|---|---|---|
| `ss01` | cursive `a`/`g`, identical to `CRSV=1` | yes, if you like it |
| `tnum` | tabular figures (the default figures are proportional: `1` is 814 units, `0` is 1296) | only for tables and code |
| `case` | a subset of the Greek `calt` rules - a no-op while `calt` is on | pointless |
| `pnum` | no-op unless `tnum` is on | pointless |
| `frac`, `sups`, `ordn`, `aalt` | fractions, superscripts, `H2O` to `H2º`, every alternate at once | **never** |

Measured on the built package, 44 px, `Gg a αγ Agenda`: baked with no CSS is
**pixel-identical** to stock Geologica with `font-feature-settings: "ss01" 1`
(0 differing pixels), 5305 pixels differ from the stock font, and `"calt" 0`
restores the stock glyphs exactly. `FEATURE_FAMILY="Geologica Cursive"`
installs it as a second family; it cannot be combined with `GEO_UI_WEIGHT`,
since both would rename the same file.

## Differences from the sibling packages

- **The default master is Thin**, so the variable bytecode's blue zones are
  Thin's. That is why the default preset is `natural` (no x-height boost), why
  `sharp`/`balanced` are much worse here than for Inter/SF Pro, and why the
  static build is more than a convenience.
- **The autohinter wins.** For Inter and SF Pro the bytecode `natural` preset
  tied with `hintslight`; for Roboto Flex it beat the autohinter on dots. For
  Geologica `hintslight` is equal at 400-700 and better at 900, so the honest
  recommendation is "no hintstyle change needed", and the bytecode is for
  desktops that are on `hintmedium` for other reasons.
- **A light desktop font needs its own family.** GTK drops the weight from
  `font-name`, so Thin as the UI font is the opt-in `Geologica UI` (an `avar`
  copy of the VF), not a fontconfig rule (section 1.4).
- **No italic fix and no weight fix.** pango applies the full italic instance
  (slnt **and** CRSV) and derives the weight correctly; the Thin default never
  reaches an application. Nothing is enabled by default in this package.
- **Browsers lose the cursive forms** of the italic: CSS has `slnt` but no
  `CRSV`; use `font-feature-settings: "ss01"`.
- No OTF/CFF path: the source is TrueType only.

## Sources

- [googlefonts/geologica](https://github.com/googlefonts/geologica) (archived),
  commit `685f38d7`, `fonts/variable/Geologica[CRSV,SHRP,slnt,wght].ttf`
- [Google Fonts: ofl/geologica](https://github.com/google/fonts/tree/main/ofl/geologica)
  – same file, byte for byte
- [ttfautohint documentation](https://freetype.org/ttfautohint/doc/ttfautohint.html)
- [OpenType spec: fvar, STAT, GSUB FeatureVariations (rvrn), OS/2 fsSelection](https://learn.microsoft.com/en-us/typography/opentype/spec/)
- [fontconfig user documentation (fontvariations, fontfeatures, qual)](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html)
- [GTK blog – On fractional scales, fonts and hinting](https://blog.gtk.org/2024/03/07/on-fractional-scales-fonts-and-hinting/)
- Sibling READMEs: `ttf-inter-hinted/README.md`, `ttf-roboto-flex-hinted/README.md`,
  `nerd-fonts-apple-hinted/README.md`
