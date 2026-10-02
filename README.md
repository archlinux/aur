# ttf-roboto-flex-hinted

[Roboto Flex](https://github.com/googlefonts/roboto-flex) 3.200, the 13-axis
variable Roboto, hinted with ttfautohint for FreeType, with working italics on
Linux and fontconfig presets for its axes. Optionally cut into static fonts
and Nerd Fonts patched. Build options are documented in the header of
`PKGBUILD`, the full axis and feature reference is in `FEATURES.md`.

This file covers **what the package changes, why, and the settings that
decide how Roboto Flex renders**. The rendering pipeline itself
(GTK4 → pango → cairo → FreeType) is explained in the sibling package
`nerd-fonts-apple-hinted/README.md`, which this package follows.

Measured on 2026-10-02: GNOME 50.5 on Wayland, GTK 4.22.5, pango 1.58.2,
cairo 1.18.6, HarfBuzz 14.5.1, FreeType 2.14.3, fontconfig 2.18.3,
ttfautohint 1.8.4.

---

## What upstream ships, and what this package adds

Upstream's release zip contains a single file,
`RobotoFlex[GRAD,XOPQ,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght].ttf`:
one variable font, **unhinted** (no glyph has instructions), no separate
italic file. The Google Fonts copy is the same version (3.200, same glyphs and
features). The AUR's `ttf-roboto-flex` installs that file as it is.

| | upstream / `ttf-roboto-flex` | this package |
|---|---|---|
| Hinting | none → FreeType's autohinter | ttfautohint bytecode, preset `balanced` (measured below) |
| "Roboto Flex Italic" in GTK/pango | **renders upright** | real 10° italic (`81-roboto-flex-italic.conf`) |
| Axis presets by name | – | `Roboto Flex Condensed`, `… Dark`, … (opt-in) |
| Static fonts / Nerd Fonts | – | `FLEX_VARIANT=static`, `NERD_PATCH=true` |
| Docs | – | this README, `FEATURES.md` in `/usr/share/doc/ttf-roboto-flex-hinted/` |

Files installed (default build):

```
/usr/share/fonts/roboto-flex/RobotoFlex-Variable.ttf
/usr/share/fontconfig/conf.avail/79-roboto-flex-families.conf   (opt-in)
/usr/share/fontconfig/conf.avail/80-ttf-roboto-flex-hinted.conf (opt-in)
/usr/share/fontconfig/conf.avail/81-roboto-flex-italic.conf
/usr/share/fontconfig/conf.default/81-roboto-flex-italic.conf  → enabled by pacman's fontconfig hook
```

---

## TL;DR — recommended settings

The same as for the sibling packages, so if `ttf-inter-hinted` or
`nerd-fonts-apple-hinted` already render with their bytecode hints, nothing
needs to change:

| Where | Setting | Why |
|---|---|---|
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'`, `font-hinting 'medium'`, `font-antialiasing 'grayscale'` | In `automatic` GTK4 forces hintslight, which ignores the hints |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | Whole-pixel advances give uneven gaps |
| fontconfig | global `hintmedium` + `autohint=false`, **or** symlink `80-ttf-roboto-flex-hinted.conf` | For clients that read hinting from fontconfig (Firefox, Chromium, Qt, kitty/foot). GTK3/GTK4 in manual mode take the hint style from gsettings and ignore fontconfig's `hintstyle` |
| fontconfig | `prgname` → `hintslight` for chrome, chromium, electron, code, … | Chromium rounds advances at hintmedium (sibling README §10). The 80- snippet already excludes them |
| fontconfig | keep `81-roboto-flex-italic.conf` enabled (default) | Otherwise italics render upright, see below |
| Firefox `user.js` | `gfx.text.subpixel-position.force-enabled = true` | Firefox rounds advances at hintmedium (sibling README §9) |

```sh
gsettings set org.gnome.desktop.interface font-rendering manual
gsettings set org.gnome.desktop.interface font-hinting medium
gsettings set org.gnome.desktop.interface font-antialiasing grayscale
# gtk-4.0/settings.ini: gtk-hint-font-metrics=false
# only if hintmedium is not your global fontconfig default:
sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-roboto-flex-hinted.conf /etc/fonts/conf.d/
# optional, the named axis presets:
sudo ln -s /usr/share/fontconfig/conf.avail/79-roboto-flex-families.conf /etc/fonts/conf.d/
```

**What the upstream font gets instead.** It has an (empty) `prep` table but no
glyph instructions. fontconfig reports `fonthashint=False`, while FreeType
treats the face as hinted and does **not** autohint it at hintmedium: the
bitmaps are hash-identical to `NO_HINTING` (`NORMAL` = `NORMAL|NO_AUTOHINT` =
`NO_HINTING` ≠ `NORMAL|FORCE_AUTOHINT`, 13 px). A `fonthashint=false →
hintslight` fontconfig rule (present in this machine's `fonts.conf`) helps
Firefox, but GTK in manual mode ignores fontconfig's hintstyle. So with
`font-hinting medium`, upstream Roboto Flex renders **completely unhinted** in
every GTK app (row "hintmedium, upstream" in §3). The hinted build gets
hintmedium with its own bytecode:

```sh
fc-match -v 'Roboto Flex:pixelsize=14.67' file hintstyle autohint fonthashint
# expected: …/roboto-flex/RobotoFlex-Variable.ttf, hintstyle 2, autohint False, fonthashint True
```

---

## 1. Italics: two bugs and the fix

Roboto Flex has no italic file. Italic is the `slnt` axis at −10, and the
font's 20 named instances include "Italic", "Bold Italic" and so on.

**Bug 1: italics render upright.** fontconfig matches the "Italic" named
instance correctly (`fc-match 'Roboto Flex:italic'` → style Italic). pango,
however, applies its own variations to every variable font, `wght` from the
weight and `opsz` from the size, and doing that resets every other axis to its
default. The instance's `slnt=-10` is lost. Measured with pango-view:
"Roboto Flex Italic 12" was **pixel-identical** to "Roboto Flex 12".
The plain AUR package has this bug.

**Fix, part 1:** a `target="pattern"` rule appends `fontvariations slnt=-10`
when Roboto Flex is requested in italic or oblique. pango merges fontconfig's
variations with its own. The same rule on `target="font"` is ignored by pango,
even though `fc-match` then shows it.

**Bug 2: double slant.** With part 1 only, the system's
`90-synthetic.conf` still saw a roman face (pango can match the variable
face itself, whose slant is roman because slnt defaults to 0) and added its
fake 0.2 shear matrix **on top** of the real slant:

| | slant of `l`, 72 pt |
|---|---|
| Regular | 0.00° |
| `@slnt=-10` | 10.03° |
| "Italic", part 1 only | **19.60°** |
| "Italic", full fix | 10.03° |
| "Bold Italic", full fix | 10.01° |
| "Condensed Italic" (families preset), full fix | 10.04° |
| Inter Variable Italic (unaffected) | 5.46° (its own design) |

**Fix, part 2:** a `target="font"` rule in the same file marks the match
italic. The file sorts before 90, so the synthetic rule skips it.

Both rules use `qual="first"`: they fire only when Roboto Flex is the first
family requested, never when it is a fallback in a `sans-serif` list
(verified: `sans-serif:italic` and `Inter Variable:italic` get no
`fontvariations`). Verified in a real GTK4 (GSK) render with manual,
hintmedium, metric hinting off: Italic 10.07°, Condensed Bold Italic 10.00°.

Bold needs no fix: "Roboto Flex Bold 11" renders pixel-identical to
`@wght=700`, and no synthetic emboldening is added.

Static builds have real italic files with italic metadata (fsSelection,
macStyle, `post.italicAngle = -10`, caret slope) and do not need the rule.

## 2. Axis presets by name (`79-roboto-flex-families.conf`, opt-in)

Font names that select axis settings of the one variable font, for programs
that only accept a font name (gsettings, GTK CSS, terminal and editor configs):

| Name | Equivalent |
|---|---|
| `Roboto Flex SuperCondensed` … `ExtraCondensed` | `@wdth=25` / `50` / `62.5` |
| `Roboto Flex Condensed` | `@wdth=75` |
| `Roboto Flex SemiCondensed` | `@wdth=87.5` |
| `Roboto Flex SemiExpanded` / `Expanded` / `ExtraExpanded` | `@wdth=112.5` / `125` / `151` |
| `Roboto Flex Dark` | `@GRAD=-25`: slightly lighter strokes for light text on dark backgrounds, same widths |
| `Roboto Flex Graded` | `@GRAD=100`: heavier strokes, same widths |

They combine with weight, italic and size: "Roboto Flex Condensed Bold Italic
11" gives `wght=700, wdth=75, slnt=-10`. Verified pixel-identical to the
explicit `@…` form. They do not show up in font pickers, and only pango
reads them (Firefox/Chromium ignore fontconfig variations; use CSS there).

Width is restrained at text sizes by design: SuperCondensed is only 11 %
narrower at 11 pt. The table is in `FEATURES.md`.

Writing your own preset: copy one `<match>` into `~/.config/fontconfig/fonts.conf`,
change the name and the variation string (any axis, e.g. `XTRA=420,YTLC=530`).

## 3. Hinting: why `balanced`

Measured with FreeType 2.14.3 through freetype-py (`measure.py`):
glyphs rendered at the given ppem with the variable font set to
`opsz = size in pt` (what pango does), Regular/Medium/SemiBold, roman and
italic, 10–20 px.

- **glued**: dot or diaeresis of `i j ï ä ö ü ϊ ϋ ë ΐ ΰ` touching the letter
  body, i.e. no pixel row under 25 % coverage between them
- **height**: flat and round letters disagree on x-height (Latin `xzvwun` vs
  `oecsa`, Greek `ικντ` vs `οσεα`), cap height (`HEIT` vs `OCG`) or baseline
  (50 % coverage edge)
- **deviation**: summed coverage difference from an 8× supersampled unhinted
  render, % of its ink, best 1/8 px alignment (lower = closer to the outline)

| Rendering | glued (of 726) | glued at Regular | height | deviation |
|---|---|---|---|---|
| hintmedium, upstream font (= no hinting, what GTK shows) | 241 | – | 74 | 0.8 |
| hintslight (autohinter), upstream font | 113 | 21 | 0 | 9.9 |
| bytecode `natural` (n) | 47 | 4 | 0 | 10.1 |
| **bytecode `balanced` (q), default** | **20** | **0** | **0** | 11.2 |
| bytecode `sharp` (s) | 12 | 0 | 0 (78 at 10–48 px²) | 12.6 |

² sharp breaks x-height/baseline agreement at larger sizes. Deviation of the bytecode rows is from the 5-weight run (400–900), the others from the 3-weight run

Where they glue:

- **hintslight** glues the *diaereses*: `ä ö ü ë ï ΐ ΰ` at Regular 12–13 px,
  everything at SemiBold 10–11 and 18–19 px.
- **natural** glues only `i`/`j`, from Regular 13 px up, plus one `ë`.
- **balanced** never glues at Regular; `i`/`j` only at Medium 13 px and
  SemiBold 12/13/18/19 px. Equal or better than natural at every weight and size.

The remaining `i`/`j` cases are the design: the gap between the dot and the
stem is about 1 px at SemiBold 13 px (157/2048 em) and 0.5–0.9 px at Black.
No hinter keeps that open without distorting the letter, and on screen
SemiBold "illicit" at 12 px is borderline in every mode.

`balanced` uses `--increase-x-height=14`, like the sibling packages. With 0
instead: glued 20 vs 24, deviation 11.70 vs 11.31. No real difference.

### Hinting a variable font

ttfautohint keeps `fvar`, `gvar`, `avar`, `STAT`, `MVAR`, the feature
variations and all 20 instances. Its blue zones (the heights it snaps to) are
taken from the **default master** (opsz 14, wght 400, wdth 100), while
Roboto Flex's x-height and cap height move with opsz, wght and the parametric
axes. Checked across the other axes (400 and 600, 11–17 px):

| Axis setting | glued slight / natural / balanced | height mismatches |
|---|---|---|
| wdth 25, 75, 125, 151 | 15–26 / 6–15 / **2–4** | 0 |
| GRAD −200 / 150 | 12, 43 / 2, 14 / **0, 10** | ≤1 (all modes) |
| opsz 8 | 19 / 6 / **2** | 0 |
| opsz 36 / 72 / 144 at 11–17 px | 2–5 / 44–73 / **56–72** | 1–7 (all modes) |

Only a *large* opsz rendered *small* breaks the hints. That combination does
not occur: pango sets opsz = size in pt and browsers opsz = CSS px, and with
those realistic pairs up to 48 px `balanced` has 0 height mismatches up to
32 px. Above that, every mode, the autohinter included, has a few, from the
design's overshoots. Hinting stops above 48 px (`--hinting-limit`).

The static build (`FLEX_VARIANT=static`) hints each instance on its own, so
its blue zones match that exact instance. The price is that the optical size
is frozen (`STATIC_OPSZ`, default 14) and the axes are gone.

### hintslight ignores the hints

As measured for the siblings: with hintslight FreeType uses its own light
autohinter, and the bytecode only runs at hintmedium/hintfull. This is why the
TL;DR settings matter. They are the same settings the sibling packages need.

---

## 4. fontconfig features block

`fontfeatures` in fontconfig adds OpenType features for every pango app. For
Roboto Flex the only optional one is `pnum` (proportional figures), so the
useful block is short:

```xml
<match target="font">
  <test name="family"><string>Roboto Flex</string></test>
  <edit name="fontfeatures" mode="assign_replace">
    <!-- <string>pnum</string> -->   <!-- proportional figures; default is tabular -->
    <!-- <string>-liga</string> -->  <!-- turn off ff/fi/fl ligatures -->
  </edit>
</match>
```

HarfBuzz always enables `ccmp locl mark mkmk kern calt liga clig rlig` and
the required `rvrn`; leaving one out does not turn it off, write it negated
(`-liga`). Verified: with `pnum` through fontconfig, "1111 0000" went from 74
to 62 px in pango-view.

---

## Verifying on your own system

```sh
# 1. hinted file, hintmedium, bytecode
fc-match -v 'Roboto Flex:pixelsize=14.67' file hintstyle autohint fonthashint
# 2. the italic rule is active (expect slnt=-10)
fc-match 'Roboto Flex:italic' --format='%{family[0]} %{style[0]} %{fontvariations}\n'
# 3. italic really slants 10 degrees, not 0 and not ~20
pango-view --no-display --font='Roboto Flex Italic 72' -t l -o /tmp/l.png
# 4. Chromium stays on hintslight (prgname is the executable's basename)
cp /usr/bin/fc-match /tmp/chrome; /tmp/chrome 'Roboto Flex:pixelsize=16' --format='%{hintstyle}\n'   # 1
# 5. presets (after enabling 79-…)
fc-match 'Roboto Flex Condensed:bold:italic' --format='%{family[0]} %{fontvariations}\n'
```

Re-run the hinting measurements with `measure.py`
(`python measure.py FONT.ttf medium '{"wght":400,"opsz":9.75}' 13`).

### Pitfalls met here

- **Rule order in test configs.** Testing snippets with a wrapper config that
  `<include>`s `/etc/fonts/fonts.conf` *and then* the new files runs them after
  every `conf.d` rule, `90-synthetic.conf` included. That produced the double
  slant only in testing and hid that the part-2 rule works. Test with a copy
  of `conf.d` plus symlinks, so files sort as they will when installed.
- An isolated test config (`FONTCONFIG_FILE` + an empty `XDG_CONFIG_HOME`)
  has no `90-synthetic.conf`, so it never showed bug 2 at all. Test the real
  configuration as well as the isolated one.
- `fc-match` shows `fontvariations` for `target="font"` edits too, but pango
  only applies the ones from the request pattern. Check the rendered output,
  not just `fc-match`.
- pango derives opsz from the size: comparing renders at different sizes
  compares different optical sizes. Pin `@opsz=` when you want only the
  hinting to differ.
- First establish under which hint mode a font was seen before and after a
  complaint (`/var/log/pacman.log` against the `fonts.conf` backups and
  gsettings). In the Iosevka investigation of 2026-10-02 the font was
  unchanged; the global switch from hintslight to hintmedium changed the look.
- ttfautohint leaves the vertical metrics alone (hhea, OS/2 typo/win,
  fsSelection, gasp, advances: all identical before and after). It only
  rewrites `head.flags` (27 → 15), harmless for FreeType 2.14.3.
- The measured "glued" counts depend on the threshold (25 %); visually a gap
  row at 20–30 % reads as touching. Look at the renders too.

---

## Differences from the sibling packages

- Roboto Flex is unhinted upstream. `HINTING=false` installs it as shipped,
  which at hintmedium means **no hinting at all** (empty `prep`, see TL;DR),
  and at hintslight the autohinter. Not a useful fallback.
- Default preset `balanced`, as for SF Pro Text (Inter uses `natural`):
  `natural` glues i/j from Regular 13 px.
- The variable font is the default and the recommended install. Only it has
  automatic optical size and every axis.
- No OTF/CFF path: the source is TrueType only.

## Sources

- [googlefonts/roboto-flex](https://github.com/googlefonts/roboto-flex), release 3.200
- [ttfautohint documentation](https://freetype.org/ttfautohint/doc/ttfautohint.html)
- [OpenType spec: fvar, avar, STAT, GSUB FeatureVariations (rvrn)](https://learn.microsoft.com/en-us/typography/opentype/spec/)
- [fontconfig user documentation (fontvariations, fontfeatures, qual)](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html)
- `/etc/fonts/conf.d/90-synthetic.conf` (fontconfig 2.18.3)
- Sibling READMEs: `nerd-fonts-apple-hinted/README.md`, `ttf-inter-hinted/README.md`
