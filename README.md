# ttf-xmind-hinted

[Xmind](https://fonts.google.com/specimen/Xmind) (Google Fonts, OFL), ξανά-hinted
με ttfautohint για FreeType. Προαιρετικά static αντί για variable, και
προαιρετικά patched με Nerd Fonts. Τα χαρακτηριστικά της γραμματοσειράς (features,
κάλυψη, Ελληνικά) είναι στο `FEATURES.md`.

## 1. Εγκατάσταση

    makepkg -si              # ρωτάει, όταν τρέχει από τερματικό
    makepkg -si </dev/null   # δεν ρωτάει: μόνο προεπιλογές

Επιλογές: βλέπε την κεφαλίδα του `PKGBUILD` (`XM_VARIANT`, `STATIC_WEIGHTS`,
`STATIC_ITALIC`, `NERD_PATCH`, `HINTING`, `HINT_PRESET`, `FEATURE_DEFAULTS`,
`GASP_MODE`, …). Οι απαντήσεις σώζονται στο `$srcdir/.build_opts`.

`FEATURE_DEFAULTS=fonts.conf` (ή η αντίστοιχη επιλογή στο μενού) ψήνει τα features
που είναι ενεργά (χωρίς σχόλιο) στο `<match>` της οικογένειας `Xmind` του
`~/.config/fontconfig/fonts.conf` (άλλο αρχείο: `XM_FONTS_CONF`). Παραλείπονται, με
σημείωση, τα αρνητικά (`-liga`), όσα δεν υπάρχουν στο GSUB, όσα εφαρμόζει ήδη
κάθε shaper (`kern liga ccmp locl`) και όσα αρνείται το `make_features.py`
(`aalt ordn dlig`). Έτσι το `kern`/`liga` του block δεν χαλά το build.

Μετά την εγκατάσταση, για bytecode hinting (δεν ενεργοποιείται μόνο του):

    sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-xmind-hinted.conf /etc/fonts/conf.d/
    fc-cache -f

Το αρχείο ισχύει για clients που διαβάζουν hinting από το fontconfig (Firefox,
Qt, kitty/foot). Το GTK3/GTK4 παίρνει το hint style από το gsettings. Το
Chromium και τα Electron εξαιρούνται με `prgname`: σε device scale 1 στρογγυλεύουν
κάθε advance στο `hintmedium`.

Firefox: χρειάζεται `gfx.text.subpixel-position.force-enabled = true` στο
`about:config` (ή `user.js`), αλλιώς στρογγυλεύει τα advances στο `hintmedium`.

## 2. Τι αλλάζει σε σχέση με το upstream

- Το upstream δεν έχει hinting. Στο `hintmedium`/`hintfull` το FreeType δεν
  τρέχει τον autohinter για γραμματοσειρά που θεωρεί hinted, άρα το Xmind
  εμφανίζεται χωρίς καμία προσαρμογή.
- Το πακέτο περνά ttfautohint (`--ignore-restrictions --no-info`,
  default και fallback script `latn`). Το `fvar/gvar/STAT/HVAR/MVAR` μένουν.
- Στο static build κάθε στυλ κόβεται με τον instancer του fontTools και
  hint-άρεται χωριστά, ώστε οι blue zones να ταιριάζουν στο βάρος.

## 3. Μετρήσεις (FreeType 2.15, `measure.py`)

Λέξη «Hamburgefonstiv Αλφάβητο 0123», 12/13/14/16 px (το Thin 16/18/20/24 px,
γιατί στα μικρά μεγέθη η γραμμή δεν φτάνει το 25% κάλυψη).

- **glued:** πόσες από τις τελείες/διαλυτικά i j ï ä ö ü ë ё ϊ ϋ ΐ ΰ ακουμπούν το γράμμα.
- **dev:** απόκλιση από το σχεδιασμένο περίγραμμα, σε % του μελανιού (χαμηλότερο = πιο κοντά).

| wght | πηγή | glued | dev |
|---|---|---|---|
| 100 | unhinted | 11 | 1,7 |
| 100 | hintslight (autohinter) | 4 | 27,0 |
| 100 | natural static / VF | 4 / 4 | 27,5 / 27,9 |
| 100 | balanced / sharp VF | 3 / 0 | 83,6 / 70,4 |
| 400 | unhinted | 10 | 0,9 |
| 400 | hintslight | 6 | 12,6 |
| 400 | **natural** static / VF | 7 / 7 | **12,5** / 13,2 |
| 400 | balanced static / VF | 0 / 0 | 19,6 / 19,5 |
| 400 | sharp static / VF | 0 / 0 | 20,6 / 20,3 |
| 700 | unhinted | 36 | 0,6 |
| 700 | hintslight | 14 | 8,6 |
| 700 | natural static / VF | 16 / 4 | 8,9 / 12,3 |
| 700 | balanced static / VF | 0 / 0 | 9,6 / 14,5 |
| 700 | sharp static / VF | 0 / 0 | 11,9 / 16,6 |
| 900 | unhinted | 23 | 0,4 |
| 900 | hintslight | 7 | 6,1 |
| 900 | natural static / VF | 5 / 8 | 6,0 / 12,7 |
| 900 | balanced static / VF | 4 / 4 | 7,4 / 11,4 |
| 900 | sharp static / VF | 2 / 4 | 7,5 / 11,6 |

Το `height` (ασυμφωνία ύψους επίπεδων/στρογγυλών γραμμάτων) είναι 0 σε κάθε
hinted περίπτωση στα 400–900. Unhinted: 3–4 γράμματα.

Συμπεράσματα:

1. **Το hinting βοηθά:** το unhinted έχει 10–36 κολλημένες τελείες, το hinted
   0–16, και ισοπεδώνει τα ύψη.
2. **Preset `natural` (προεπιλογή):** το πιο κοντά στο σχέδιο στο Regular
   (12,5), αλλά αφήνει 7 κολλημένες τελείες. Το `balanced` τις ανοίγει όλες στο
   Regular, με dev 19,6. Αν σε ενοχλούν οι τελείες, χρησιμοποίησε `balanced`.
3. **Thin:** το `balanced`/`sharp` την παραμορφώνουν (dev 70–84). Στα βάρη 100–200
   κράτα το `natural` ή το `light`.
4. **Static ή variable:** στα 700–900 το static είναι πιο κοντά στο σχέδιο
   (dev 8,9 έναντι 12,3 στο Bold, 6,0 έναντι 12,7 στο Black), γιατί το x-height
   ανεβαίνει με το βάρος και οι blue zones του VF είναι του Regular. Στο
   Regular δεν υπάρχει διαφορά. Προεπιλογή το variable, ένα αρχείο για όλα τα βάρη.
5. **Το hintslight** (ο autohinter του FreeType, προεπιλογή του Arch) μετράει
   πρακτικά όσο το natural. Αν η επιφάνεια εργασίας έχει ήδη `hintslight`, το
   πακέτο δεν χρειάζεται για την εμφάνιση. Προσφέρει το bytecode σε όσους
   τρέχουν `hintmedium`/`hintfull`.

Δεν μετρήθηκε το πλάγιο (Italic): ίδιες ρυθμίσεις, ίδια μέθοδος.

## 4. Τεχνικές από τα άλλα πακέτα

`HINT_INTEGER_PPEM` είναι κλειστό (μεγαλώνει το κείμενο στο Linux +16–19%
μελάνι σε μικρά μεγέθη). `GASP_MODE=keep`: το FreeType αγνοεί το gasp.
`FEATURE_DEFAULTS` ψήνει features στο `calt` (το fontconfig `fontfeatures`
φτάνει μόνο στο pango). Το Nerd Fonts patching γίνεται πριν το hinting, και
αναγκάζει static, γιατί το font-patcher αφαιρεί το fvar/gvar.

## 5. Επαλήθευση

    python measure.py FONT.ttf MODE '{"wght":400}' 12,13,14,16 glued,height,dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
