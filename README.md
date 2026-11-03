# ttf-geom-hinted

[Geom](https://fonts.google.com/specimen/Geom) (Thanos Poulakidas, Google Fonts,
OFL), ξανά-hinted με ttfautohint για FreeType. Προαιρετικά static αντί για
variable, και προαιρετικά patched με Nerd Fonts. Τα χαρακτηριστικά της
γραμματοσειράς (features, κάλυψη, Ελληνικά) είναι στο `FEATURES.md`.

Αντικαθιστά το παλιό `geom-ttf-hinted-git` (conflicts).

## 1. Εγκατάσταση

    makepkg -si              # ρωτάει, όταν τρέχει από τερματικό
    makepkg -si </dev/null   # δεν ρωτάει: μόνο προεπιλογές

Επιλογές: βλέπε την κεφαλίδα του `PKGBUILD` (`GM_VARIANT`, `STATIC_WEIGHTS`,
`STATIC_ITALIC`, `NERD_PATCH`, `HINTING`, `HINT_PRESET`, `FEATURE_DEFAULTS`,
`GASP_MODE`, …). Οι απαντήσεις σώζονται στο `$srcdir/.build_opts`.

`FEATURE_DEFAULTS=fonts.conf` (ή η αντίστοιχη επιλογή στο μενού) ψήνει τα features
που είναι ενεργά (χωρίς σχόλιο) στο `<match>` της οικογένειας `Geom` του
`~/.config/fontconfig/fonts.conf` (άλλο αρχείο: `GM_FONTS_CONF`). Παραλείπονται, με
σημείωση, τα αρνητικά (`-liga`), όσα δεν υπάρχουν στο GSUB, όσα εφαρμόζει ήδη
κάθε shaper (`kern liga ccmp locl`) και όσα αρνείται το `make_features.py`
(`aalt ordn dlig`). Έτσι το `kern`/`liga` του block δεν χαλά το build.

Μετά την εγκατάσταση, για bytecode hinting (δεν ενεργοποιείται μόνο του):

    sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-geom-hinted.conf /etc/fonts/conf.d/
    fc-cache -f

Το αρχείο ισχύει για clients που διαβάζουν hinting από το fontconfig (Firefox,
Qt, kitty/foot). Το GTK3/GTK4 παίρνει το hint style από το gsettings. Το
Chromium και τα Electron εξαιρούνται με `prgname`: σε device scale 1 στρογγυλεύουν
κάθε advance στο `hintmedium`.

Firefox: χρειάζεται `gfx.text.subpixel-position.force-enabled = true` στο
`about:config` (ή `user.js`), αλλιώς στρογγυλεύει τα advances στο `hintmedium`.

## 2. Τι αλλάζει σε σχέση με το upstream

- Το upstream δεν έχει hinting (μόνο ένα μικρό `prep`). Στο `hintmedium`/`hintfull`
  το FreeType δεν τρέχει τον autohinter για γραμματοσειρά που θεωρεί hinted, άρα
  το Geom εμφανίζεται χωρίς καμία προσαρμογή.
- Το πακέτο περνά ttfautohint (`--ignore-restrictions --no-info`, default και
  fallback script `latn`). Το `fvar/gvar/STAT/HVAR` μένουν.
- Στο static build κάθε στυλ κόβεται με τον instancer του fontTools και
  hint-άρεται χωριστά.

## 3. Μετρήσεις (FreeType 2.15, `measure.py`)

Λέξη Latin/Greek, 12/13/14/16 px.

- **glued:** πόσες από τις τελείες/διαλυτικά i j ï ä ö ü ϊ ϋ ΐ ΰ ακουμπούν το γράμμα.
- **dev:** απόκλιση από το σχεδιασμένο περίγραμμα, σε % του μελανιού (χαμηλότερο = πιο κοντά).

| wght | πηγή | glued | dev |
|---|---|---|---|
| 300 | unhinted | 5 | 2,4 |
| 300 | hintslight (autohinter) | 4 | 10,5 |
| 300 | natural static / VF | 4 / 5 | 10,2 / 11,2 |
| 300 | balanced static / VF | 4 / 4 | 10,4 / 13,4 |
| 300 | sharp static / VF | 4 / 4 | 11,4 / 12,2 |
| 400 | unhinted | 6 | 2,1 |
| 400 | hintslight | 6 | 10,4 |
| 400 | **natural** static / VF | 6 / 6 | **9,9** / 10,5 |
| 400 | balanced static / VF | 4 / 4 | 10,1 / 10,6 |
| 400 | sharp static / VF | 4 / 4 | 11,7 / 12,0 |
| 700 | unhinted | 19 | 1,4 |
| 700 | hintslight | 8 | 9,2 |
| 700 | natural static / VF | 8 / 12 | 9,5 / 12,4 |
| 700 | balanced static / VF | 8 / 8 | 9,9 / 13,1 |
| 700 | sharp static / VF | 6 / 8 | 11,5 / 13,6 |
| 900 | unhinted | 19 | 1,1 |
| 900 | hintslight | 19 | 6,0 |
| 900 | natural static / VF | 9 / 12 | 5,8 / 14,4 |
| 900 | balanced static / VF | 11 / 10 | 7,1 / 14,6 |
| 900 | sharp static / VF | 7 / 12 | 8,3 / 15,0 |

Το `height` (ασυμφωνία ύψους επίπεδων/στρογγυλών γραμμάτων) είναι 0 σε κάθε
hinted περίπτωση. Unhinted: 1–3 γράμματα.

Συμπεράσματα:

1. **Το hinting βοηθά** κυρίως στα βαριά βάρη: το unhinted 700–900 έχει 19
   κολλημένες τελείες, το `natural` static 8–9, και ισοπεδώνει τα ύψη.
2. **Preset `natural` (προεπιλογή):** το πιο κοντά στο σχέδιο. Το `balanced`
   ανοίγει 2 τελείες παραπάνω στο 400 (4 έναντι 6) με πρακτικά ίδιο dev
   (10,1 έναντι 9,9). Αν σε ενοχλούν οι τελείες στο Regular, δοκίμασε `balanced`.
   Το `sharp` ανεβάζει το dev σε 11–15 χωρίς όφελος.
3. **Static ή variable:** στο 300–400 δεν υπάρχει ουσιαστική διαφορά. Στο 700–900
   το static είναι σαφώς πιο κοντά στο σχέδιο (Bold 9,5 έναντι 12,4, Black 5,8
   έναντι 14,4) και ανοίγει περισσότερες τελείες. Προεπιλογή το variable (ένα
   αρχείο για όλα τα βάρη). Αν χρησιμοποιείς τα βαριά βάρη, πάρε `GM_VARIANT=static`.
4. **Το hintslight** (ο autohinter του FreeType, προεπιλογή του Arch) μετράει
   πρακτικά όσο το natural στο 300–700. Το πακέτο προσφέρει το bytecode σε όσους
   τρέχουν `hintmedium`/`hintfull`. Στο 900 το hintslight αφήνει 19 κολλημένες
   τελείες, το natural static 9.

Δεν μετρήθηκε το πλάγιο (Italic): ίδιες ρυθμίσεις, ίδια μέθοδος.

## 4. Τεχνικές από τα άλλα πακέτα

`HINT_INTEGER_PPEM` είναι κλειστό (μεγαλώνει το κείμενο στο Linux). `GASP_MODE=keep`:
το FreeType αγνοεί το gasp. `FEATURE_DEFAULTS` ψήνει features στο `calt` (το
fontconfig `fontfeatures` φτάνει μόνο στο pango). Το Nerd Fonts patching γίνεται
πριν το hinting και αναγκάζει static, γιατί το font-patcher αφαιρεί το fvar/gvar.

## 5. Επαλήθευση

    python measure.py FONT.ttf MODE '{"wght":400}' 12,13,14,16 glued,height,dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
