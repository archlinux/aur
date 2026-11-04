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

### Μετρήσεις render σε πραγματικό GTK4 (offscreen) — preset `crisp`

Μετρήθηκε με τον πραγματικό GTK4 renderer, hintmedium, grayscale, στις 3 οθόνες
(eDP 2240x1400 scale 1.33, DELL 27" 1080p, ASUS 15.6" 1080p· UI font 12pt).

| ppem | natural (nnn) | crisp (nns) |
|------|---------------|-------------|
| 16 (1x οθόνες) | οριζόντιες μπάρες 1 γραμμή + αχνή (crispness 0.67) | ακριβώς 1px (1.00), αλλά -8% μελάνι |
| 21.3 (eDP) | 2px καθαρά (1.00) | 2px καθαρά (1.00) |

- Το 3ο γράμμα του `--stem-width-mode` είναι αυτό που μετράει με FreeType v40.
- Το `crisp` + fontconfig weight 88 (~wght 440) επαναφέρει το μελάνι: 12pt scale 1
  → 0.96 του design (χωρίς shift 0.916), 12pt eDP → ~1.05.
- Το Pango `@wght=` ΔΕΝ επηρεάζει το VF· το fontconfig `weight` (target="pattern") ναι.
- Το GTK4 αγνοεί `gtk-xft-rgba` → μόνο grayscale. Στον Firefox χρειάζεται
  `gfx.text.subpixel-position.force-enabled=true` αλλιώς οι advances στρογγυλοποιούνται.
- Ανεπίσημο όριο: unhinted έχει σφάλμα ~7-8% από την ιδανική (supersampled) εικόνα,
  hinted ~16-19%: αυτό είναι το trade-off ομαλότητας/καθαρότητας.

### Γιατί ΔΕΝ υπάρχει preset `crisp` (δοκιμάστηκε και απορρίφθηκε)

Το `nns` κουμπώνει τις οριζόντιες μπάρες σε 1px, αλλά οι κάθετες κολώνες μένουν
στο 1.5px (y-only hinting). Αναλογία οριζόντιο/κάθετο στα 16 ppem (GTK4, μέτρηση):

| | κάθετη | οριζόντια | λόγος |
|---|---|---|---|
| unhinted | 1.48 | 1.33 | 0.90 |
| natural (nnn) | 1.54 | 1.33 | 0.87 |
| nns | 1.54 | 1.00 | 0.65 |
| nns + weight 88 | 1.65 | 1.00 | 0.61 |

Το σχέδιο έχει ~0.9. Το nns το διαλύει: τα γράμματα φαίνονται άνισου πάχους.
Το weight shift το χειροτερεύει (πρασινίζει μόνο τις κάθετες). Η καθαρότητα
μιας μπάρας δεν είναι ίδια με την ομοιομορφία του πάχους· το `natural` κρατά τις
αναλογίες του σχεδίου και είναι το σωστό default.

## 4. Κατάληξη (δοκιμές σε GTK4, `hintslight`, 2026-11)

Ο τελικός συνδυασμός για GNOME/Wayland με `font-hinting = slight`:

    REGULAR_WGHT=auto EVEN_SPACING=all HINTING=false makepkg -si

| Επιλογή | Τι κάνει | Αξίζει στο `slight`; |
|---|---|---|
| `HINTING` (ttfautohint, presets) | bytecode hinting | **Όχι**: το `slight` χρησιμοποιεί τον autohinter του FreeType και αγνοεί το bytecode· με και χωρίς hint το αποτέλεσμα βγαίνει πανομοιότυπο. Ωφελεί μόνο `medium`/`full` (εκεί τα κάθετα πάχη βγαίνουν ομοιόμορφα, sd 0.00 έναντι 0.14) |
| `REGULAR_WGHT=auto` | κόβει το Regular σε static στο wght όπου οι οριζόντιες μπάρες πέφτουν σε ακέραιο pixel (`fit_weight.py`, 16 ppem, ανοχή 0.25 → **335** για το Akt) και ξαναμοιράζει τα βάρη κάτω από το Bold (`SCALE_WEIGHTS`, π.χ. R=330 → Light 253, Medium 453, SemiBold 577) | **Ναι**: η αχνή γραμμή κάτω από την πάνω μπάρα του Τ/τ πέφτει από 0.53 σε 0.36 του μέγιστου |
| `EVEN_SPACING=all` | kern lookup που εξισώνει τα οπτικά κενά ζευγών (`even_spacing.py`) | Ανεξάρτητο από το hinting (αλλάζει μόνο το GPOS) |

### `fit_weight.py` (`REGULAR_WGHT=auto`)

Μετρά το ύψος της μπάρας του `=` και το πλάτος του στελέχους του `l` σε instances
ανά 50 μονάδες wght (παρεμβολή ανά 5) και διαλέγει το μεγαλύτερο wght ≤ 400
όπου η μπάρα (σε pixel = πάχος × ppem / upem) είναι μέσα στην ανοχή από ακέραιο ≥ 1.
Η ανοχή 0.25 (όχι 0.2) γιατί το hinting αφαιρεί ~0.08px από τη γεωμετρική μπάρα·
με 0.2 έβγαινε 315, που φάνηκε χειρότερο από το 330. 12 και 21.33 ppem → 400
(δεν χρειάζεται αλλαγή). Έξοδος 400 ή αποτυχία = κανένα cut.

### `even_spacing.py` (`EVEN_SPACING`)

Για κάθε ζεύγος πεζών και κάθε ζεύγος κεφαλαίων (Latin, Greek, Cyrillic, ή λίστα) μετρά
το εμβαδόν του κενού μέχρι το x-height / cap height, με τα προφίλ κομμένα σε βάθος
(οι ανοιχτές φόρμες ς, λ, c, ε δεν πιστώνονται υπερβολικά), και προσθέτει ένα νέο
GPOS kern lookup (class kerning, τα τονισμένα ακολουθούν το βασικό γράμμα) που φέρνει
κάθε ζεύγος στη διάμεσο. Δεν αγγίζει ζεύγη που ο σχεδιαστής έχει ήδη kern-άρει
(AV, λώ, τα).

Calibration ανά font: το `depth` και το `strength` προσαρμόζονται στα ζεύγη που ο
σχεδιαστής έκανε kern με το χέρι (η διόρθωση που ζητά το μέτρο πρέπει να συμφωνεί
μαζί τους· Akt: ~4700 ζεύγη, r 0.41–0.60, depth 0.18–0.28). Αν r < 0.25, πέφτει σε
depth 0.22 / strength 0.8. Τα `--max`/`--min` ακολουθούν το μέγεθος-στόχο
(1px / 0.1px στο `FIT_PPEM`). Παράκαμψη: `EVEN_STRENGTH`, `EVEN_DEPTH`, `EVEN_MAX`,
`EVEN_MIN`. Αποτέλεσμα: διασπορά κενών 51.7 → 35.7 (std, μονάδες/1000).

    python even_spacing.py --stats --report ει,ώσ,ab FONT.ttf   # μόνο μέτρηση

Επαληθεύτηκε με πραγματικό Pango shaping: το «ώσ» ανοίγει +2.1px στα 100pt, ενώ
τα kerned ζεύγη (λώ, AV) μένουν ίδια.

### Όριο: οι αποστάσεις στο GTK4

Αρχικά φάνηκε ότι το GTK4 στρογγυλεύει το x των γλυφών (κενά 0/1/2px). Η καλύτερη
μέτρηση (κέντρα βάρους έναντι 8× supersampled) έδειξε σφάλμα μόλις 0.10px (max 0.29)
σε όλα τα `hintstyle`, `gtk-font-rendering` και renderers: η τοποθέτηση είναι σωστή.
Το `gtk-hint-font-metrics=true` τη χειροτερεύει (0.17 / 0.51). Η «περίεργη απόσταση»
στο «εκδηλώσεις» ήταν στο ίδιο το φόντ (άνισα sidebearings, π.χ. λώ 75 έναντι ις 136
μονάδες), γι' αυτό υπάρχει το `EVEN_SPACING`.

## 5. Τεχνικές από τα άλλα πακέτα

`HINT_INTEGER_PPEM` είναι κλειστό (μεγαλώνει το κείμενο στο Linux). `GASP_MODE=keep`:
το FreeType αγνοεί το gasp. `FEATURE_DEFAULTS` ψήνει features στο `calt` (το
fontconfig `fontfeatures` φτάνει μόνο στο pango). Το Nerd Fonts patching γίνεται
πριν το hinting και αναγκάζει static, γιατί το font-patcher αφαιρεί το fvar/gvar.

## 6. Επαλήθευση

    python measure.py FONT.ttf MODE '{"wght":400}' 12,13,14,16 glued,height,dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
