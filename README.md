# ttf-michelangelus

[Michelangelus](https://learn.microsoft.com/en-us/typography/font-list/michelangelus)
1.10, including Regular, Italic, Bold, and Bold Italic.

## Local testing

From this directory, build and install with:

```sh
makepkg -si
```

Fonts are installed to `/usr/share/fonts/ttf-michelangelus/`. Font cache updates
are handled by the existing pacman hooks, without a package install script.

## Licensing

The fonts are proprietary. The Microsoft EULA permits installation and use,
but does not grant redistribution rights. Building downloads the original ZIP
directly from Microsoft; do not publish the ZIP or the resulting binary package.
The unmodified upstream EULA is installed to
`/usr/share/licenses/ttf-michelangelus/EULA.rtf`.

`LICENSE` applies only to these packaging files (0BSD), not to the fonts.

## Packaging references

Reviewed the five highest-voted `ttf-*` packages on AUR as of 2026-10-18:

- [ttf-ms-fonts](https://aur.archlinux.org/packages/ttf-ms-fonts)
- [ttf-google-fonts-git](https://aur.archlinux.org/packages/ttf-google-fonts-git)
- [ttf-vista-fonts](https://aur.archlinux.org/packages/ttf-vista-fonts)
- [ttf-mac-fonts](https://aur.archlinux.org/packages/ttf-mac-fonts)
- [ttf-inconsolata-g](https://aur.archlinux.org/packages/ttf-inconsolata-g)

This package follows the current
[font packaging guidelines](https://wiki.archlinux.org/title/Font_package_guidelines),
rather than copying older conventions: `arch=('any')`, a per-package font
directory, no runtime dependencies, and no `ttf-font` provision for a single
serif family.
