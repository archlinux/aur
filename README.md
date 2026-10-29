# ttf-commissioner-hinted

[Commissioner](https://fonts.google.com/specimen/Commissioner) 1.012 by Kostas
Bartsokas, hinted with ttfautohint for FreeType, optionally cut into static
fonts and Nerd Fonts patched, plus fontconfig family names for its Flare and
Loud voices. Build options are documented in the header of `PKGBUILD`; the full
axis and OpenType feature reference is in `FEATURES.md`.

This file covers **what the package changes, why, and whether Commissioner
reacts to the usual Linux font settings like its siblings**. It assumes the
rendering pipeline explanation in `ttf-inter-hinted/README.md` (GTK4 → pango →
cairo → FreeType) and the verification methods in
`ttf-roboto-flex-hinted/README.md`.

Measured on 2026-10-26: GNOME on Wayland with `font-rendering=manual`,
`font-hinting=slight`, grayscale antialiasing and `gtk-hint-font-metrics=false`;
GTK 4.24.1, pango 1.58.2, cairo 1.18.6, HarfBuzz 14.6.0, FreeType 2.15.0,
fontconfig 2.18.3, fontTools 4.67.0, ttfautohint 1.8.4.

---

## What upstream ships, and what this package adds

Upstream (`github.com/kosbarts/Commissioner`) is **active and tagged**: 1.012,
2025-11-18. It ships two variable fonts and 54 statics. This package pins the
tag and takes the two variable fonts from it.

That is the first thing worth knowing, because **the 54 statics are hinted and
the variable fonts are not**:

| | upstream statics | upstream variable | this package |
|---|---|---|---|
| Hinting | ttfautohint (name table: `Version 1.012; ttfautohint (v1.8.4.16-eb64)`), one flag set for all 54 files | none: no `fpgm`, no `cvt`, 0 glyph instructions, 7-byte `prep` → at `hintmedium` FreeType snaps nothing (measured identical to `NO_HINTING`) | ttfautohint bytecode, preset `natural`, per file |
| Files | 54 (3 voices × 9 weights × italic) | roman + italic, 3 axes each | roman + italic, or the 54 statics with `COMM_VARIANT=static STATIC_VOICES="default flare loud"` |
| Voice names | `Commissioner`, `CommissionerFlare`, `CommissionerLoud` | axis values only | opt-in `79-commissioner-families.conf`: `Commissioner Flare`, `Commissioner Loud`, `Commissioner Semi Flare` |
| Nerd Fonts | – | – | `NERD_PATCH=true` |
| Docs | README of the sources | – | this README, `FEATURES.md` in `/usr/share/doc/ttf-commissioner-hinted/` |

Which variable font is not obvious, so it was investigated. Upstream's
repository contains a third one, `Commissioner[FLAR,VOLM,slnt,wght].ttf`, and
**that** is the one Google Fonts distributes. It is stale: `Version
1.001;gftools[0.9.23]`, 1123 glyphs, 983 code points, not present in the 1.012
release archive, and missing everything 1.012 added (`tnum`, `ss01`, the
fraction machinery, the Greek feature fixes). The roman+italic pair this
package installs is 1.012 in both files, 1172 glyphs and 994 code points each.
The cost of leaving the slanted file out is a continuous `slnt` axis: the
italic file is pixel-identical to that file at `slnt=-12`, in every weight and
in all three scripts (section 1.3 of `FEATURES.md`), so what a desktop loses is
nothing that it can reach anyway - pango, Firefox and Chromium all ask for the
italic *style*.

Files installed (default build):

```
/usr/share/fonts/commissioner/Commissioner-Roman.ttf
/usr/share/fonts/commissioner/Commissioner-Italic.ttf
/usr/share/fontconfig/conf.avail/79-commissioner-families.conf   (opt-in)
/usr/share/fontconfig/conf.avail/80-ttf-commissioner-hinted.conf (opt-in)
/usr/share/doc/ttf-commissioner-hinted/{README,FEATURES}.md
```

Nothing is enabled by default, and unlike `ttf-roboto-flex-hinted` there is no
fontconfig fix that has to be on: Commissioner's weights, italics and voices
already work (section 1).

---

## TL;DR — recommended settings

| Where | Setting | Why |
|---|---|---|
| gsettings `org.gnome.desktop.interface` | `font-rendering 'manual'`, `font-hinting 'slight'`, `font-antialiasing 'grayscale'` | `hintslight` is what renders Commissioner best: the light autohinter keeps the dots off the stems at Bold and Black, where the bytecode cannot (section 2) |
| fontconfig | **no** `80-ttf-commissioner-hinted.conf` | the bytecode is for desktops on `hintmedium`; at `slight` it is ignored, and it glues 72 dot cases at Black against 34 for the autohinter |
| `~/.config/environment.d/90-freetype.conf` | `FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0"` | **do enable it**: +39% ink on Thin, +23% on ExtraLight, +10% on Regular. The light end of this family is unusable at 11-12 px without it (section 2.6) |
| `~/.config/gtk-4.0/settings.ini` | `gtk-hint-font-metrics=false` | whole-pixel advances give uneven letter gaps |
| `/etc/fonts/conf.d/` | leave `10-hinting-slight.conf` (the Arch default) enabled | |
| fontconfig, optional | symlink `79-commissioner-families.conf` | family names for the Flare and Loud voices (section 3) |
| CSS in browsers | `font-variation-settings: "FLAR" 100` for flare, `"VOLM" 100` on top of that for Loud | browsers cannot set axes from a font name |

On a desktop that runs `hintmedium`/`hintfull` globally, do the opposite: link
the 80- snippet so Commissioner gets its bytecode instead of rendering
unhinted, and keep `gtk-hint-font-metrics=false`.

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

## 1. The three axes, the Thin default, and what pango does with them

| Tag | Name | Min | Default | Max | What it does |
|---|---|---|---|---|---|
| `wght` | Weight | 100 | **100** | 900 | Thin … Black. Line width +4.5% at 900 vs 400 |
| `FLAR` | Flare | 0 | 0 | 100 | Straight grotesque terminals swell into glyphic serifs. Line width +0.5%, ascenders 3/2000 em longer, x-height and cap height unchanged |
| `VOLM` | Volume | 0 | 0 | 100 | Turns those serifs into wedges. Without `FLAR` it is a no-op: no extent moves, and only `s` and `Α` change advance width (by 5 and 3 units) |

Nine named instances per file, roman and italic, all at `FLAR=0, VOLM=0`. The
italic is a separate file, not an axis, and it is complete (weight and voice
axes included).

**The default weight is Thin**, like Geologica: `fvar` says `wght` 100,
`OS/2.usWeightClass` is 100, the name table says "Commissioner Thin".

### 1.1 pango and browsers do not render Thin by accident

fontconfig exposes the nine roman instances and the nine italic instances as
styles of the family `Commissioner`. pango derives `wght` from the requested
weight and picks the italic file for the italic style:

| Request | Rendered as | Result |
|---|---|---|
| `Commissioner 12` | pixel-identical to `Commissioner 12 @wght=400` | correct |
| `Commissioner Bold 12` | identical to `@wght=700` | correct |
| `Commissioner Thin 12` | identical to `@wght=100` | correct |
| `Commissioner Italic 12` | the italic file at `wght=400`, 12.0° | correct |

Nothing leaks the Thin default into applications, and no fontconfig rule is
needed for the italic - the one thing Geologica needed a CSS workaround for.

Browsers behave the same way (`font-weight` and `font-style` map to the weight
axis and to the italic file), and `font-variation-settings` reaches `FLAR` and
`VOLM`, which CSS cannot spell any other way.

### 1.2 The x-height barely moves with the weight

| | Thin 100 | Regular 400 | Bold 700 | Black 900 |
|---|---|---|---|---|
| x-height (`x`) | 992 | 999 | 1007 | 1016 |
| cap height (`H`) | 1426 | 1426 | 1426 | 1426 |
| ascender (`b`) | 1478 | 1484 | 1492 | 1500 |

24 units between Thin and Black, against 80 for Geologica, and the cap height
never moves. ttfautohint writes one set of blue zones, taken from the default
(Thin) master; here they are 24 units off at Black at worst, which at 12 px is
0.14 px. That is why the bytecode and the autohinter agree on *where* the
outline lands in this family, and why the two hinting engines differ only in
the dot metric (section 2).

### 1.3 Line metrics

`hhea` and the `OS/2` typo metrics are 2034/-412/0 in every instance, the
`fsSelection` `USE_TYPO_METRICS` bit is set, so the default line height is
1.223 em everywhere and neither axis changes it. `usWinAscent/Descent` are
2424/586 (Windows).

---

## 2. Hinting: what the bytecode does to Commissioner

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

### 2.1 Dots and diaereses (glued, 10-20 px) and deviation (12/13/14/16 px)

| Build | Thin 100 | Regular 400 | Bold 700 | Black 900 | dev 100/400/700/900 |
|---|---|---|---|---|---|
| unhinted (= upstream at `hintmedium`) | 0 | 6 | 38 | 129 | 4.1 / 2.7 / 1.5 / 1.0 |
| `hintslight` (FreeType's light autohinter) | **0** | **0** | **6** | **34** | 12.5 / 11.7 / 8.4 / 7.0 |
| bytecode `natural` (n, **default**) | 0 | 8 | 8 | 72 | **12.1 / 11.7 / 7.9 / 6.5** |
| bytecode `balanced` (q) | 0 | 7 | 8 | 72 | 12.3 / 11.8 / 7.9 / 6.4 |
| bytecode `sharp` (s) | 0 | 8 | 8 | 70 | 54.1 / 12.3 / 10.5 / 7.2 |
| bytecode `light` (n, 12-48 px) | 0 | 8 | 8 | 72 | 12.1 / 11.7 / 7.9 / 6.5 |
| static build, `natural`, hinted per weight | 0 | 5 | 8 | 129 | 11.0 / 11.2 / 8.0 / 6.4 |
| upstream's own statics (their flags) | 0 | 0 | 7 | 123 | 11.9 / 11.9 / 8.8 / 10.7 |

Reading:

- Unhinted, Commissioner's dots merge badly above Regular: 129 of 165 cases at
  Black. Hinting is not a luxury for this font.
- **The two engines disagree on the dots, not on the heights.** At Black the
  autohinter glues 34 cases, the bytecode 72. Look at a 12 px `i` in Black and
  the reason is visible: the gap between dot and stem is below one pixel, the
  autohinter opens it by rounding the dot and the stem independently, and
  ttfautohint's bytecode - which drives both from the same blue zone - cannot.
- **Deviation is the other way round**: at Bold and Black the bytecode is
  closer to the designed outline (7.9/6.5 against 8.4/7.0). There is no
  blue-zone mismatch to blame; the bytecode simply snaps stems more firmly.
- `sharp` is not usable here: stem mode `s` on one-pixel hairlines sends the
  Thin deviation to 54.1.
- `natural` and `light` measure identically because nothing below 12 px is
  different in the test strings that matter; `balanced` differs only in the
  stem mode, because its `-x 14` is silently ignored on a variable font
  (section 2.5).
- The static build wins the deviation at Thin (11.0) and at Regular (11.2) and
  loses the dots at Black (129, worse than the variable font's 72).

### 2.2 What the bytecode does to vertical positions

Mean (hinted − unhinted) y of the topmost outline point of `x o H`, in px:

| wght | 12 px bytecode / slight | 13 px | 14 px | 16 px |
|---|---|---|---|---|
| 100 | +0.15 / -0.19 | +0.58 / +0.58 | +0.01 / +0.01 | -0.14 / -0.14 |
| 400 | +0.12 / -0.21 | +0.55 / +0.55 | -0.03 / -0.03 | -0.17 / -0.17 |
| 700 | +0.08 / -0.26 | +0.51 / +0.51 | -0.07 / -0.07 | -0.22 / -0.22 |
| 900 | +0.04 / -0.29 | +0.46 / +0.46 | -0.11 / -0.11 | -0.27 / -0.27 |

The two renderers move the outline to the **same pixel** at 13, 14 and 16 px in
all four weights - identical to the hundredth - and part only at 12 px, by
0.4 px. Compare Geologica, where they part by up to a full pixel at Bold and
Black. The measured `height` metric (flat vs round letters disagreeing on
x-height or cap height) is 0 for every hinted row.

### 2.3 Does it matter in practice?

At 400 the autohinter wins outright: the same deviation (11.7 against 11.7) and
no glued dots at all (0 against 8). At 700 the bytecode is 0.5 closer to the
outline and glues 2 more cases. At 900 the bytecode is 0.5 closer and glues 38
more. So:

- If your desktop is on `hintslight` (the Arch default), do nothing. That is
  the best single setting for this font, and it is what the autohinter does.
- If it is on `hintmedium`, the 80- snippet gives a render that is a large
  improvement over unhinted (72 glued cases at Black instead of 129) and better
  than the autohinter on deviation, at the cost of some dot separation at Bold
  and Black.

### 2.4 Stem darkening (autohinter only)

`FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0"`, ink of the test string
at 11-16 px:

| | Thin 100 | ExtraLight 200 | Regular 400 |
|---|---|---|---|
| off (the Arch default) | 239.3 | 346.6 | 571.7 |
| on | 332.8 (+39%) | 425.3 (+23%) | 629.4 (+10%) |

This matters more than it does for Geologica (+16% / +7%): Commissioner Thin
keeps its hairlines at 11-12 px only with stem darkening on, and the difference
is visible in running text, not just in a measurement. It has no effect on the
bytecode (that is the native hinter), which is one more reason the `slight`
setup is the better one for this font.

### 2.5 `--increase-x-height` is ignored on the variable font

`-x 0`, `-x 30` and `-x 60` produce **byte-identical rendering** on the
variable font: still 8 glued at `wght` 400 and 72 at 900, same deviation to the
decimal. ttfautohint cannot raise the x-height of an instance it does not know,
so the knob only has an effect on statics - where it does help: a static
Regular hinted with `-x 14` glues 0 cases instead of 5, for 0.1 of extra
deviation, which is what upstream's own statics do.

That is the one place where `COMM_VARIANT=static HINT_PRESET=balanced` is worth
trying: it opens the dots at Regular on every machine, including the ones on
`hintmedium`. For the variable font the preset choice is a choice of stem mode
only.

### 2.6 Hinting the other axes and the italic

Bytecode `natural`, 12-20 px glued / 12/13/14/16 px deviation:

| | `FLAR=0` | `FLAR=100` | `FLAR=100, VOLM=100` |
|---|---|---|---|
| bytecode, wght 400 | 8 / 11.7 | 8 / 12.0 | 8 / 11.9 |
| `hintslight`, wght 400 | 0 / 11.7 | 0 / 11.8 | – |
| bytecode, wght 900 | 72 / 6.5 | 72 / 6.6 | – |
| `hintslight`, wght 900 | 34 / 7.0 | 24 / 6.9 | – |

and the italic file, at `wght` 400 / 900: bytecode 7 / 12.5 and 72 / 6.9,
`hintslight` 3 / 12.6 and 34 / 7.3. The flare axis changes the terminals, not
the heights, so the hints survive it; the italic file behaves like the roman
because it is the roman.

No `height` mismatches in any of these combinations.

### 2.7 `head.flags` bit 3 (integer ppem)

ttfautohint leaves bit 3 of `head.flags` clear; fontbakery fails hinted fonts
for it, because Windows GDI needs whole-pixel ppem. On Linux the flag does not
change the ppem FreeType picks - measured 11 px at 8 pt / 96 dpi with the bit
clear **and** set - it only feeds the hinter's integer assumption, which moves
ink by up to 3.5% (`+3.5%` at 8 pt, `-2.5%` at 10 pt, nothing at 9 or 12 pt,
where the ppem is already whole). `HINT_INTEGER_PPEM=true` sets it for people
who want fontbakery clean or who match Windows; the default leaves it off.

---

## 3. Family names for the Flare and Loud voices (`79-commissioner-families.conf`)

Opt-in, variable build only. Same mechanism as the Roboto Flex width presets: a
`target="pattern"` rule renames the request and appends `fontvariations`, which
pango applies on top of its own `wght` and its choice of the italic file.

| Name | Equivalent |
|---|---|
| `Commissioner Flare` | `@FLAR=100` (the designer's `CommissionerFlare`) |
| `Commissioner Loud` | `@FLAR=100,VOLM=100` (the designer's `CommissionerLoud`) |
| `Commissioner Semi Flare` | `@FLAR=50` (not one of the designer's voices) |

They combine with weight, italic and size (`Commissioner Flare Bold Italic 11`
= FLAR=100, wght=700, italic file), do not appear in font pickers, and are read
by pango only. Firefox and Chromium ignore fontconfig variations; use CSS
there. There is no `Volume` name because `VOLM` alone is exactly the default
voice - measured, not assumed.

---

## 4. Verifying on your own system

```sh
# 1. which file, and is it hinted?
fc-match -v 'Commissioner' file fonthashint
#   upstream variable font: fonthashint False     this package: True

# 2. the italic is a separate file, and pango finds it
fc-match -f '%{file}\n' 'Commissioner:italic'
#   .../Commissioner-Italic.ttf

# 3. weight: "Commissioner 12" must be Regular, not Thin (the font's default)
pango-view --no-display --pixels --margin=0 --font='Commissioner 72' -t a -o /tmp/a.png
pango-view --no-display --pixels --margin=0 --font='Commissioner 72 @wght=400' -t a -o /tmp/b.png
cmp /tmp/a.png /tmp/b.png && echo same

# 4. the voices, once 79-… is enabled
fc-match 'Commissioner Flare:bold' --format='%{family[0]} %{fontvariations}\n'
#   Commissioner FLAR=100

# 5. Chromium stays on hintslight (prgname is the executable's basename)
cp /usr/bin/fc-match /tmp/chrome
/tmp/chrome 'Commissioner:pixelsize=16' --format='%{hintstyle}\n'   # 1
```

Re-run the measurements with `measure.py`:

```sh
python measure.py Commissioner-Roman.ttf medium '{"wght":900}' 12,13,14,16
python measure.py Commissioner-Italic.ttf slight '{}' 10,11,12
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
- **`@ss01=1` in a font description is silently ignored** - pango parses it as
  an axis name, and there is no such axis. Features go through fontconfig
  `fontfeatures`, pango markup `font_features`, or HarfBuzz.
- **`-calt` does not turn off the Greek ano teleia**, because `locl` performs
  the same substitution; you need `-calt -locl` to see the raw string.
- **pango reads only the first element of the `fontvariations` list.** A
  fontconfig rule with two `<edit name="fontvariations" mode="append">`
  elements applies the first axis and silently drops the rest, so a two-axis
  preset must be one string (`FLAR=100,VOLM=100`). This was caught here by
  comparing `Commissioner Loud 72` against the explicit
  `@FLAR=100,VOLM=100`: the family was rendering as Flare only.
- Comparison renders must use the same size, otherwise pango applies a
  different `wght` derivation and you compare different faces.
- The `deviation` metric is very sensitive at Thin weights: a 0.5 px vertical
  shift is a visible weight change on a one-pixel stem. Read the Thin column as
  "did the hinting move the outline", not as "how ugly is it".
- **`--increase-x-height` is silently ignored on a variable font** (section
  2.5). If you tune it and see no change, that is why.

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
FEATURE_DEFAULTS=ss01 makepkg -si     # the alternate G with a bar, in every app
```

There is almost nothing to bake here. Of the seventeen GSUB features, only
`ss01` is a design decision that a user could want globally:

| tag | effect | bake? |
|---|---|---|
| `ss01` | alternate `G` **with a bar**: `G Ĝ Ğ Ġ Ģ Ǧ` to `.ss01` forms | yes, if you like it |
| `ss02` | `б` to the Serbian form - the same substitution `locl` does for `lang="sr"` | **no**: it would give Russian text the Serbian letter |
| `case`, `tnum`, `frac`, `sups`, `subs`, `sinf`, `numr`, `dnom`, `pnum` | per-context requests (raised punctuation, tabular figures, fractions) | only per context |
| `ordn`, `aalt` | `H2O` to `H2º`, every alternate at once | **never** (`make_features.py` refuses them) |

Measured on the built package, 44 px, `Greece Gg ĜĞ Γγ`: the baked font with
no CSS at all is **pixel-identical** to the stock font with
`font-feature-settings: "ss01" 1` (0 differing pixels out of 1200x96), 191
pixels differ from the stock font, and `"calt" 0` brings the stock glyphs back
exactly. `FEATURE_FAMILY="Commissioner Barred"` installs it as a second family
instead, so both looks stay available - note that the shipped
`79-commissioner-families.conf` keeps testing for the old name then.

## Differences from the sibling packages

- **Two variable files, not one.** Upstream keeps the italic as its own file
  with the weight and voice axes, so this package installs a pair. Nothing has
  to be re-defaulted and no italic fix is needed; the font also has no `CRSV`
  axis to lose in a browser (Geologica does).
- **The third variable font in the repository is stale** (1.001, missing the
  1.012 features) even though Google Fonts ships it. This package takes the
  roman+italic pair from the 1.012 release instead, which is the version in
  both files and the only one in the release archive.
- **The autohinter wins on dots, the bytecode on deviation.** For Geologica the
  autohinter won both at 700-900; for Commissioner the difference is smaller
  and split, and it is entirely about the dot of `i` at 10-14 px in the heavy
  weights.
- **Stem darkening matters more** (+39% ink on Thin against Geologica's +16%).
- **`-x` does nothing on the variable font** here (Geologica's package used it
  in the `balanced` preset; on a VF that knob never had an effect, which the
  Geologica measurements could not separate because its preset also changed the
  stem mode).
- **The AUR packages `ttf-commissioner`, `otf-commissioner` and
  `ttf-commissioner-variable` are one pkgbase** (`commissioner-font`) that
  unpacks the release archive as it comes: 54 statics (hinted by upstream) and
  the two variable fonts (unhinted). `ttf-commissioner-variable` installs the
  same two files this package installs, into the same directory, only without
  hinting - which is why all three conflict with this one. They answer
  different questions: 54 prebuilt statics, or two hinted variable fonts
  (measured above: our hinting is closer to the outline at Black, 6.4 against
  the 10.7 of upstream's own flags).

## Sources

- [kosbarts/Commissioner](https://github.com/kosbarts/Commissioner), tag 1.012
  - `fonts/variable/Commissioner[FLAR,VOLM,wght].ttf` (sha256 `63ce7044…e3b6`)
  - `fonts/variable/Commissioner-Italic[FLAR,VOLM,wght].ttf` (`f14e7295…53f6`)
- [Google Fonts: ofl/commissioner](https://github.com/google/fonts/tree/main/ofl/commissioner)
  - ships `Commissioner[FLAR,VOLM,slnt,wght].ttf`, byte-identical to the stale
    file in the repository (`db01279a…47d3`, version 1.001)
- [ttfautohint documentation](https://freetype.org/ttfautohint/doc/ttfautohint.html)
- [OpenType spec: fvar, avar, STAT, GSUB FeatureVariations (rvrn), OS/2 fsSelection](https://learn.microsoft.com/en-us/typography/opentype/spec/)
- [fontconfig user documentation (fontvariations, fontfeatures, qual)](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html)
- [GTK blog – On fractional scales, fonts and hinting](https://blog.gtk.org/2024/03/07/on-fractional-scales-fonts-and-hinting/)
- Sibling READMEs: `ttf-inter-hinted/README.md`, `ttf-roboto-flex-hinted/README.md`,
  `ttf-geologica-hinted/README.md`, `nerd-fonts-apple-hinted/README.md`
