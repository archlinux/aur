# ttf-prologue

[Prologue](https://fontlibrary.org/en/font/prologue), a sans-serif font family
derived from Epilogue, with changes by Cristiano Sobral to the italic `a` and
`g`, vertical metrics, and other details.

This package installs all 18 unmodified static TTFs from the pinned Font
Library archive. The fonts identify themselves as Version 1.002, dated
July 14, 2020; the download URL uses a Font Library archive ID rather than
a version number.

## Local testing

From this directory, build and install with:

```sh
makepkg -si
```

Select **Prologue** in your application. The nine weights are Thin,
ExtraLight, Light, Regular, Medium, SemiBold, Bold, ExtraBold, and Black,
each upright and italic. The fonts cover Latin-script languages, not Chinese.
This is Prologue, not the separate commercial CA Prologue family.

Fonts are installed to `/usr/share/fonts/ttf-prologue/`. Font cache updates
use the existing pacman hooks without a package install script.

## Licensing

The original SIL OFL 1.1 license and copyright notices are preserved in
`/usr/share/licenses/ttf-prologue/OFL.txt`. The supplied license does not
declare any Reserved Font Names. Embedded font copyright and license
metadata are also retained without modification.

`LICENSE` covers only these packaging files (0BSD), not the fonts.
