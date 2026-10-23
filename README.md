# ttf-kerberos

[Kerberos](https://jul-sh.github.io/Kerberos/) 1.4.1, a serif font family for
long-form reading. This package installs the six unmodified static TTFs from
the pinned upstream release: Light, Regular, and Bold, each upright and italic.

## Local testing

From this directory, build and install with:

```sh
makepkg -si
```

Select **Kerberos** in your application. The fonts cover Latin, Greek, and
Cyrillic, not Chinese. Static fonts use fixed styles; for adjustable optical
size, grade, weight, and lowercase height, use `ttf-kerberos-variable` instead.
The packages conflict because upstream recommends installing only one variant.

Fonts are installed to `/usr/share/fonts/ttf-kerberos/`. Font cache updates use
the existing pacman hooks without a package install script.

## Licensing

The original font license and copyright notices are installed to
`/usr/share/licenses/ttf-kerberos/OFL.txt` (SIL OFL 1.1, including the upstream
Reserved Font Names). `LICENSE` covers only these packaging files (0BSD), not
the fonts.
