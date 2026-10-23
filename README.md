# ttf-vavin

[Vavin](https://adrbn.github.io/vavin/) 1.1, a Garamond-derived serif font
family with a larger x-height for screen reading.

This package installs all nine unmodified desktop TTFs from the pinned
upstream release. Latin-only app subsets and WOFF2 webfonts are not installed.

## Local testing

From this directory, build and install with:

```sh
makepkg -si
```

## Families

| Family | Styles | Intended use |
| --- | --- | --- |
| Vavin | Regular, Italic, Bold, Bold Italic | Body text and long-form reading |
| Vavin Condensed | Regular, Italic, Bold | Headlines and narrow columns |
| Vavin Display | Regular, Black | Large titles and posters |

For reading, select **Vavin**, not Condensed or Display. The fonts cover
Latin, Greek, and Cyrillic, not Chinese.

Fonts are installed to `/usr/share/fonts/ttf-vavin/`. Font cache updates use
the existing pacman hooks without a package install script.

## Licensing

The original SIL OFL 1.1 license, Reserved Font Name, and upstream copyright
notices are preserved in `/usr/share/licenses/ttf-vavin/OFL.txt`. The upstream
derivation history is installed to `/usr/share/doc/ttf-vavin/FONTLOG.txt`.

`LICENSE` covers only these packaging files (0BSD), not the fonts.
