# ttf-tiktok-sans-hinted

[TikTok Sans](https://fonts.google.com/specimen/TikTok+Sans) (TikTok Inc., Grilli
Type, Contrast Foundry, Type Network, Google Fonts, OFL). Προαιρετικά static αντί
για variable, προαιρετικά ξανά-hinted με ttfautohint, προαιρετικά patched με Nerd
Fonts. Τα χαρακτηριστικά (features, κάλυψη, Ελληνικά, Κυριλλικά) είναι στο
`FEATURES.md`.

**Διαφορά από τα άλλα πακέτα:** το upstream έρχεται ήδη hinted (το Google Fonts
πέρασε ttfautohint). Το πακέτο δεν «διορθώνει» απουσία hinting: συγκρίνει και
προσφέρει καλύτερο hinting μόνο εκεί που το μέτρησε καλύτερο (static).

## 1. Εγκατάσταση

    makepkg -si              # ρωτάει, όταν τρέχει από τερματικό
    makepkg -si </dev/null   # δεν ρωτάει: μόνο προεπιλογές

Επιλογές πακέτου: βλέπε την κεφαλίδα του `PKGBUILD` (`TS_VARIANT`,
`STATIC_WEIGHTS`, `STATIC_ITALIC`, `STATIC_WIDTHS`, `STATIC_OPSZ`, `NERD_PATCH`).
Το tuning (hinting, gasp, features στο `calt`, …) το κάνει το
[fonttune](https://github.com/gaou-piou/fonttune): οι ερωτήσεις γίνονται στο
`prepare()` και κάθε απάντηση μπορεί να δοθεί έτοιμη ως `FONTTUNE_<KEY>`
(`FONTTUNE_HINT`, `FONTTUNE_GASP`, `FONTTUNE_FEATURES`, …). Οι τελικές επιλογές
σώζονται στο `/usr/share/doc/ttf-tiktok-sans-hinted/fonttune.toml`. Τα στατικά
κόβονται με `fonttune statics`. Οι παλιές μεταβλητές `HINTING`, `HINT_*`,
`GASP_MODE`, `FEATURE_*` και τα `make_statics.py`, `make_features.py`,
`set_gasp.py` δεν υπάρχουν πια.

`FONTTUNE_FEATURES=fonts.conf` ψήνει τα features που είναι ενεργά (χωρίς σχόλιο)
στο `<match>` της οικογένειας `TikTok Sans` του `~/.config/fontconfig/fonts.conf`
(άλλο αρχείο: `TS_FONTS_CONF`).

Παραδείγματα:

    TS_VARIANT=static makepkg -si                       # 7 βάρη + πλάγια, opsz auto, wdth 100
    TS_VARIANT=static STATIC_WIDTHS="75 100" STATIC_OPSZ=12 makepkg -si
    TS_VARIANT=static FONTTUNE_HINT=balanced makepkg -si

Μετά την εγκατάσταση, για bytecode hinting (δεν ενεργοποιείται μόνο του):

    sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-tiktok-sans-hinted.conf /etc/fonts/conf.d/
    fc-cache -f

Ισχύει για clients που διαβάζουν hinting από το fontconfig (Firefox, Qt,
kitty/foot). Το GTK3/GTK4 παίρνει το hint style από το gsettings. Το
Chromium και τα Electron εξαιρούνται με `prgname`: σε device scale 1 στρογγυλεύουν
κάθε advance στο `hintmedium`. Firefox: `gfx.text.subpixel-position.force-enabled
= true`, αλλιώς στρογγυλεύει τα advances στο `hintmedium`.

## 2. Τι αλλάζει σε σχέση με το upstream

- Το upstream έχει ήδη ttfautohint-style bytecode (fpgm 3988 bytes, cvt 117
  τιμές, εντολές σε 999 από 1167 περιγράμματα) και `cvar`.
- **Static:** κάθε στυλ κόβεται με τον instancer του fontTools (άξονες wght, wdth,
  opsz, slnt καρφωμένοι) και hint-άρεται χωριστά με τα presets του πακέτου.
- **Variable:** μένει το upstream hinting σε κάθε περίπτωση: το fonttune δεν
  hint-άρει variable fonts (τα hints ταιριάζουν μόνο στο default instance), ακόμη
  κι αν διαλέξεις hint preset. Για ξανά-hinting διάλεξε static.
- **STATIC_OPSZ:** προεπιλογή `auto`, το μέγεθος της γραμματοσειράς διεπαφής του
  GNOME σε pt (ό,τι δίνει το Pango στο opsz του variable), διαβασμένο στο
  build· σε καθαρό chroot ή εκτός GNOME είναι το 11 του GNOME, που κόβεται στο 12 (το ελάχιστο του άξονα). Η τιμή που
  χρησιμοποιήθηκε γράφεται στο `/usr/share/doc/ttf-tiktok-sans-hinted/STATIC_OPSZ`.
- Το Nerd Fonts patching αναγκάζει static και ξανά-hinting, γιατί το
  font-patcher πετά το bytecode.

## 3. Μετρήσεις (FreeType 2.15, `measure.py`)

Κείμενο `Hamburgefonstiv Αλφάβητο Ыжий 0123` (Latin, Ελληνικά, Κυριλλικά),
12/13/14/16 px. Στατικά με opsz 14, wdth 100, slnt 0.

- **glued:** πόσες από τις τελείες/διαλυτικά i j ï ä ö ü ϊ ϋ ΐ ΰ ακουμπούν το γράμμα.
- **dev:** απόκλιση από το σχεδιασμένο περίγραμμα, σε % του μελανιού (χαμηλότερο = πιο κοντά).

| wght | πηγή | glued | dev |
|---|---|---|---|
| 300 | unhinted | 10 | 3,0 |
| 300 | upstream VF / static | 0 / 0 | 20,6 / 19,6 |
| 300 | hintslight (autohinter) | 3 | 14,1 |
| 300 | natural static / VF | 0 / 0 | **13,9** / 20,0 |
| 300 | balanced static / VF | 0 / 0 | 14,3 / 19,4 |
| 300 | sharp static / VF | 0 / 0 | 17,2 / 22,0 |
| 400 | unhinted | 17 | 2,5 |
| 400 | upstream VF / static | 0 / 0 | 18,6 / 17,9 |
| 400 | hintslight | 28 | 11,9 |
| 400 | natural static / VF | 4 / 4 | 11,8 / 18,4 |
| 400 | balanced static / VF | 0 / 4 | **11,7** / 17,8 |
| 400 | sharp static / VF | 0 / 0 | 12,9 / 18,0 |
| 700 | unhinted | 28 | 1,6 |
| 700 | upstream VF / static | 0 / 0 | 12,4 / 11,9 |
| 700 | hintslight | 26 | 8,0 |
| 700 | natural static / VF | 4 / 8 | **7,8** / 14,8 |
| 700 | balanced static / VF | 19 / 8 | 8,3 / 13,9 |
| 700 | sharp static / VF | 4 / 8 | 11,1 / 15,4 |
| 900 | unhinted | 36 | 1,4 |
| 900 | upstream VF / static | 1 / 1 | 9,6 / 9,3 |
| 900 | hintslight | 16 | 7,0 |
| 900 | natural static / VF | 6 / 8 | **6,8** / 13,3 |
| 900 | balanced static / VF | 8 / 8 | 7,3 / 11,7 |
| 900 | sharp static / VF | 0 / 8 | 8,5 / 12,5 |

Το `height` είναι 0 σε κάθε hinted περίπτωση (unhinted: 4–6 γράμματα).

Συμπεράσματα:

1. **Το upstream hinting είναι σταθερό αλλά βαρύ:** καμία κολλημένη τελεία, αλλά
   dev 18–20 στο 300–400 (το x-height ανεβαίνει και τα στελέχη στρογγυλεύονται
   δυνατά). Το unhinted έχει 10–36 κολλημένες τελείες.
2. **Static + re-hint:** το `natural` πέφτει το dev στο 11,8–13,9 (400/300) και
   6,8–7,8 (900/700) με 0–6 κολλημένες. Για Regular το `balanced` ανοίγει όλες τις
   τελείες (0) με το ίδιο dev (11,7). Στο Bold όμως το `balanced` αφήνει 19
   κολλημένες· γι' αυτό προεπιλογή το `natural`, που δεν έχει κακή περίπτωση.
   Το `sharp` ανεβάζει το dev χωρίς λόγο.
3. **Variable:** το re-hint δεν ωφελεί: dev 14,8 έναντι 12,4 (Bold) και 8–4
   κολλημένες έναντι 0. Το ttfautohint παίρνει τα blue zones από το default
   master (Light, opsz 36) και δεν γράφει cvar. Γι' αυτό το variable κρατά το
   upstream hinting.
4. **Αν θέλεις το πιο πιστό στο σχέδιο:** `TS_VARIANT=static` με `natural`.
   Αν σε ενοχλεί η απουσία κολλημένων τελειών περισσότερο από την απόκλιση,
   το upstream (variable) είναι εντάξει.
5. **Το hintslight** (προεπιλογή του Arch) έχει dev ίδιο με το natural static αλλά
   αφήνει πολλές κολλημένες τελείες (400: 28, 900: 16).

Δεν μετρήθηκαν τα wdth 75/125/150, άλλα opsz εκτός 14 και το πλάγιο
(ίδιες ρυθμίσεις, ίδια μέθοδος).

## 4. Τεχνικές από τα άλλα πακέτα

Το integer-ppem είναι κλειστό (μεγαλώνει το κείμενο στο Linux). Το upstream έχει
gasp 8:10, 65535:15 (`FONTTUNE_GASP`). Το `FONTTUNE_FEATURES` ψήνει features στο
`calt` (το fontconfig `fontfeatures` φτάνει μόνο στο pango).

## 5. Επαλήθευση

    python measure.py FONT.ttf MODE '{"wght":400,"opsz":14}' 12,13,14,16 glued,height,dev

(MODE: `none`, `slight`, `medium`, `auto`. Θέλει `freetype-py` και `numpy`.)
