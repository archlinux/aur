# ttf-zen-maru-gothic-hinted

[Zen Maru Gothic](https://fonts.google.com/specimen/Zen+Maru+Gothic) (Google
Fonts, OFL), ξανά-hinted με ttfautohint για FreeType. Προαιρετικά patched με
Nerd Fonts. Τα χαρακτηριστικά της γραμματοσειράς (features, κάλυψη, Ελληνικά)
είναι στο `FEATURES.md`.

Είναι στρογγυλεμένη ιαπωνική gothic με πέντε static αρχεία (Light, Regular,
Medium, Bold, Black), χωρίς italic και χωρίς variable έκδοση.

## 1. Εγκατάσταση

    makepkg -si              # ρωτάει, όταν τρέχει από τερματικό
    makepkg -si </dev/null   # δεν ρωτάει: μόνο προεπιλογές

Επιλογές: βλέπε την κεφαλίδα του `PKGBUILD` (`WEIGHTS`, `NERD_PATCH`,
`HINTING`, `HINT_PRESET`, `FEATURE_DEFAULTS`, `GASP_MODE`, …). Οι απαντήσεις
σώζονται στο `$srcdir/.build_opts`.

Μετά την εγκατάσταση, για bytecode hinting (δεν ενεργοποιείται μόνο του):

    sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-zen-maru-gothic-hinted.conf /etc/fonts/conf.d/
    fc-cache -f

Το αρχείο ισχύει για clients που διαβάζουν hinting από το fontconfig (Firefox,
Qt, kitty/foot). Το GTK3/GTK4 παίρνει το hint style από το gsettings. Το
Chromium και τα Electron εξαιρούνται με `prgname`: σε device scale 1 στρογγυλεύουν
κάθε advance στο `hintmedium`.

Firefox: χρειάζεται `gfx.text.subpixel-position.force-enabled = true` στο
`about:config` (ή `user.js`), αλλιώς στρογγυλεύει τα advances στο `hintmedium`.

## 2. Τι αλλάζει σε σχέση με το upstream

- Το upstream δεν έχει hinting (ούτε `fpgm`/`cvt`/`prep`). Στο
  `hintmedium`/`hintfull` το FreeType δεν τρέχει τον autohinter για
  γραμματοσειρά που θεωρεί hinted, άρα η γραμματοσειρά εμφανίζεται χωρίς καμία
  προσαρμογή.
- Το πακέτο περνά ttfautohint (`--ignore-restrictions --no-info`, default
  script `latn`) **μόνο στα Latin/Greek/Cyrillic**. Τα CJK και τα kana μένουν
  όπως σχεδιάστηκαν (`--fallback-script=none --fallback-scaling`), βλέπε 3.
- Ο πίνακας `vhea/vmtx` και τα vertical features (`vert`, `vrt2`, `vkna`)
  μένουν ανέγγιχτα.

## 3. Μετρήσεις (FreeType 2.15, `measure.py`)

Λέξη Latin/Greek, 12/13/14/16 px. Για το CJK το δείγμα
«日本語の漢字ひらがなカタカナ文字永» στα 12/14/16 px (μόνο το dev).

- **glued:** πόσες από τις τελείες/διαλυτικά i j ï ä ö ü ϊ ϋ ΐ ΰ ακουμπούν το γράμμα.
- **dev:** απόκλιση από το σχεδιασμένο περίγραμμα, σε % του μελανιού (χαμηλότερο = πιο κοντά).

| βάρος | πηγή | glued | dev Latin/Greek | dev CJK |
|---|---|---|---|---|
| Light | unhinted | 2 | 3,6 | 3,3 |
| Light | hintslight (autohinter) | 0 | 12,7 | 12,8 |
| Light | **natural**, fallback none | 0 | 13,4 | 3,3 |
| Light | natural, fallback latn | 0 | 13,4 | 20,4 |
| Regular | unhinted | 6 | 3,0 | 2,8 |
| Regular | hintslight | 0 | 11,9 | 18,0 |
| Regular | **natural**, fallback none | 4 | 12,5 | 2,8 |
| Regular | natural, fallback latn | 4 | 12,5 | 22,8 |
| Regular | balanced / sharp, latn | 1 / 1 | 12,6 / 17,4 | 22,9 / 31,0 |
| Bold | unhinted | 15 | 2,2 | 2,1 |
| Bold | hintslight | 10 | 8,7 | 8,6 |
| Bold | **natural**, fallback none | 2 | 8,7 | 2,1 |
| Bold | natural, fallback latn | 2 | 8,7 | 11,4 |
| Bold | balanced / sharp, latn | 2 / 2 | 8,9 / 13,1 | 12,1 / 17,9 |
| Black | unhinted | 21 | 2,0 | 1,6 |
| Black | hintslight | 12 | 7,8 | 6,8 |
| Black | natural, latn | 4 | 8,0 | 9,5 |
| Black | balanced / sharp, latn | 4 / 2 | 8,2 / 11,3 | 11,1 / 14,7 |

Το Medium δεν μετρήθηκε χωριστά (ίδιες ρυθμίσεις, ίδια μέθοδος). Το «height»
του Light είναι artefact της hairline και αγνοείται.

Συμπεράσματα:

1. **Το hinting βοηθά στο Latin/Greek:** το unhinted έχει 6–21 κολλημένες
   τελείες, το `natural` 0–4.
2. **Τα CJK δεν πρέπει να περνούν από ttfautohint με latn fallback.** Το
   ttfautohint τα hint-άρει με Latin blue zones και η απόκλιση φτάνει 22,8
   (Regular), περισσότερο από το hintslight (18,0). Με `fallback none` μένουν
   στο unhinted επίπεδο (2,8), ενώ τα Latin/Greek αποτελέσματα δεν αλλάζουν
   καθόλου. Αυτή είναι η προεπιλογή (`HINT_FALLBACK_SCRIPT=none`).
3. **Preset `natural` (προεπιλογή):** το πιο κοντά στο σχέδιο. Το
   `balanced` δεν ανοίγει περισσότερες τελείες από το `natural` εδώ (1 έναντι 4
   στο Regular) και το `sharp` παραμορφώνει (dev 17–41 στο Regular/Light).
4. **Το hintslight** μετράει παρόμοια στο Latin/Greek, αλλά μετακινεί και τα CJK
   (dev 18,0 στο Regular). Αν χρησιμοποιείς κυρίως ιαπωνικό κείμενο και δεν
   θες bytecode, το hintslight (ή τίποτα) είναι εξίσου καλό.

## 4. Τεχνικές από τα άλλα πακέτα

`HINT_INTEGER_PPEM` είναι κλειστό (μεγαλώνει το κείμενο στο Linux). `GASP_MODE=keep`:
το FreeType αγνοεί το gasp. `FEATURE_DEFAULTS` ψήνει features στο `calt` (το
fontconfig `fontfeatures` φτάνει μόνο στο pango). Το Nerd Fonts patching γίνεται
πριν το hinting και είναι αργό: κάθε αρχείο έχει 7864 glyphs.

## 5. Επαλήθευση

    python measure.py FONT.ttf MODE '{}' 12,13,14,16 glued,height,dev
    MEASURE_TEXT='日本語の漢字' python measure.py FONT.ttf MODE '{}' 12,14,16 dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
