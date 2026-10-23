# ttf-kerberos-variable

[Kerberos](https://jul-sh.github.io/Kerberos/) 1.4.1, a serif font family for
long-form reading. This package installs the upright and italic variable TTFs
from the pinned upstream release, without modifying them.

## Local testing

From this directory, build and install with:

```sh
makepkg -si
```

Select **Kerberos** in your application. The fonts cover Latin, Greek, and
Cyrillic, not Chinese. Upstream recommends installing either the variable
fonts or the static fonts, not both; this package includes only the variable
fonts to avoid duplicate family entries. Use `ttf-kerberos` for the six static
styles instead. The two packages conflict and cannot be installed together.

## Variable axes

| Axis | Range | Purpose |
| --- | --- | --- |
| `wght` | 300–700 | Weight |
| `opsz` | 8–72 | Optical size |
| `GRAD` | -50–100 | Grade, without changing advance widths |
| `YTLC` | 500–550 | Lowercase height |

Application support for these axes varies. Fonts are installed to
`/usr/share/fonts/ttf-kerberos-variable/`, and font cache updates use the
existing pacman hooks without a package install script.

## Licensing

The original font license and copyright notices are installed to
`/usr/share/licenses/ttf-kerberos-variable/OFL.txt` (SIL OFL 1.1, including the
upstream Reserved Font Names). `LICENSE` covers only these packaging files
(0BSD), not the fonts.
