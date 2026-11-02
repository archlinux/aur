# ttf-akt-hinted

[Akt](https://fonts.google.com/specimen/Akt) (Google Fonts, OFL), ξανά-hinted με
ttfautohint για FreeType. Προαιρετικά static αντί για variable, και προαιρετικά
patched με Nerd Fonts. Τα χαρακτηριστικά της γραμματοσειράς (features, κάλυψη,
Ελληνικά, Κυριλλικά) είναι στο `FEATURES.md`.

## 1. Εγκατάσταση

    makepkg -si              # ρωτάει, όταν τρέχει από τερματικό
    makepkg -si </dev/null   # δεν ρωτάει: μόνο προεπιλογές

Επιλογές: βλέπε την κεφαλίδα του `PKGBUILD` (`AK_VARIANT`, `STATIC_WEIGHTS`,
`NERD_PATCH`, `HINTING`, `HINT_PRESET`, `FEATURE_DEFAULTS`, `GASP_MODE`, …).
Οι απαντήσεις σώζονται στο `$srcdir/.build_opts`.

`FEATURE_DEFAULTS=fonts.conf` (ή η αντίστοιχη επιλογή στο μενού) ψήνει τα features
που είναι ενεργά (χωρίς σχόλιο) στο `<match>` της οικογένειας `Akt` του
`~/.config/fontconfig/fonts.conf` (άλλο αρχείο: `AK_FONTS_CONF`). Παραλείπονται, με
σημείωση, τα αρνητικά (`-liga`), όσα δεν υπάρχουν στο GSUB, όσα εφαρμόζει ήδη
κάθε shaper (`kern liga ccmp locl`) και όσα αρνείται το `make_features.py`
(`aalt ordn dlig`). Έτσι το `kern`/`liga` του block δεν χαλά το build.

Μετά την εγκατάσταση, για bytecode hinting (δεν ενεργοποιείται μόνο του):

    sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-akt-hinted.conf /etc/fonts/conf.d/
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
  το Akt εμφανίζεται χωρίς καμία προσαρμογή.
- Το πακέτο περνά ttfautohint (`--ignore-restrictions --no-info`, default και
  fallback script `latn`). Τα `fvar/gvar/avar/STAT/HVAR/MVAR` μένουν.
- Στο static build κάθε στυλ κόβεται με τον instancer του fontTools και
  hint-άρεται χωριστά. Το Akt δεν έχει πλάγιο.

## 3. Μετρήσεις (FreeType 2.15, `measure.py`)

Κείμενο `Hamburgefonstiv Αλφάβητο Ыжий 0123` (Latin, Ελληνικά, Κυριλλικά), 12/13/14/16 px
(Thin: 16/18/20/24 px).

- **glued:** πόσες από τις τελείες/διαλυτικά i j ï ä ö ü ϊ ϋ ΐ ΰ ακουμπούν το γράμμα.
- **dev:** απόκλιση από το σχεδιασμένο περίγραμμα, σε % του μελανιού (χαμηλότερο = πιο κοντά).

| wght | πηγή | glued | dev |
|---|---|---|---|
| 100 | unhinted | 0 | 2,7 |
| 100 | hintslight (autohinter) | 0 | 17,8 |
| 100 | natural static / VF | 0 / 0 | **16,8** / 17,5 |
| 100 | balanced static / VF | 0 / 0 | 18,4 / 34,3 |
| 100 | sharp static / VF | 0 / 0 | 26,2 / 27,7 |
| 400 | unhinted | 12 | 1,7 |
| 400 | hintslight | 14 | 10,8 |
| 400 | **natural** static / VF | 2 / 2 | **10,4** / 10,8 |
| 400 | balanced static / VF | 0 / 0 | 10,7 / 11,1 |
| 400 | sharp static / VF | 0 / 0 | 12,2 / 12,3 |
| 700 | unhinted | 12 | 1,2 |
| 700 | hintslight | 12 | 7,7 |
| 700 | natural static / VF | 2 / 4 | **7,3** / 7,7 |
| 700 | balanced static / VF | 10 / 2 | 7,7 / 10,2 |
| 700 | sharp static / VF | 0 / 2 | 9,8 / 11,5 |
| 900 | unhinted | 21 | 1,0 |
| 900 | hintslight | 22 | 6,7 |
| 900 | natural static / VF | 4 / 6 | **6,4** / 6,7 |
| 900 | balanced static / VF | 2 / 4 | 6,8 / 7,7 |
| 900 | sharp static / VF | 2 / 4 | 7,9 / 8,3 |

Το `height` (ασυμφωνία ύψους επίπεδων/στρογγυλών γραμμάτων) είναι 0 σε κάθε
hinted περίπτωση από 400 και πάνω (unhinted: 1–3 γράμματα).

Συμπεράσματα:

1. **Το hinting βοηθά** στο 400–900: το unhinted έχει 12 (Regular/Bold) έως 21
   (Black) κολλημένες τελείες, το `natural` static 2–4.
2. **Preset `natural` (προεπιλογή):** το πιο κοντά στο σχέδιο σε κάθε βάρος,
   και το πιο συνεπές. Το `balanced` ανοίγει όλες τις τελείες στο Regular
   (0 έναντι 2) με πρακτικά ίδιο dev (10,7 έναντι 10,4): αν σε ενοχλούν, δοκίμασε
   το. Στο Bold static όμως ανοίγει λιγότερο (10 κολλημένες). Το `sharp`
   ανεβάζει το dev χωρίς όφελος.
3. **Static ή variable:** το static είναι ίσο ή καλύτερο παντού, με πιο έντονη
   διαφορά στα `balanced`/`sharp` (Thin balanced dev 18,4 έναντι 34,3, Bold 7,7
   έναντι 10,2). Στο `natural` η διαφορά είναι μικρή (0,3–0,7). Προεπιλογή το
   variable (ένα αρχείο για όλα τα βάρη).
4. **Thin (100):** το hinting δεν βοηθά σε τίποτα: οι τελείες δεν κολλούν ούτε
   unhinted, και το dev ανεβαίνει από 2,7 σε 17–18 (το ίδιο κάνει και ο
   autohinter του FreeType). Αν χρησιμοποιείς το Thin σε μεγάλα μεγέθη, δεν
   χάνεις τίποτα από το unhinted· σε σώμα κειμένου το Thin δεν προορίζεται.
5. **Το hintslight** (προεπιλογή του Arch) μετράει σαν το natural στο dev, αλλά
   αφήνει κολλημένες τελείες (400: 14, 900: 22). Το πακέτο προσφέρει το bytecode
   σε όσους τρέχουν `hintmedium`/`hintfull`.

## 4. Τεχνικές από τα άλλα πακέτα

`HINT_INTEGER_PPEM` είναι κλειστό (μεγαλώνει το κείμενο στο Linux). `GASP_MODE=keep`:
το FreeType αγνοεί το gasp. `FEATURE_DEFAULTS` ψήνει features στο `calt` (το
fontconfig `fontfeatures` φτάνει μόνο στο pango). Το Nerd Fonts patching γίνεται
πριν το hinting και αναγκάζει static, γιατί το font-patcher αφαιρεί το fvar/gvar.

## 5. Επαλήθευση

    python measure.py FONT.ttf MODE '{"wght":400}' 12,13,14,16 glued,height,dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
