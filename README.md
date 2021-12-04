
### `ttf-defenestration`

This package is a simple stub that allows you to remove the `ttf-liberation` package and replace it with fonts provided
by `ttf-ms-win10` or `ttf-ms-win11`.

Before you do *anything* with this PKGBUILD install ['ttf-ms-win10'] or ['ttf-ms-win11'] first, if you don't follow the
instructions you should expect things to break in spectacular ways.

For version history and any issues see: https://gitlab.com/arglebargle-arch/ttf-defenestration-PKGBUILD

#### Why? Why do this?

Most GUI packages depend on basic `ttf-font` availability; this functionality is provided by many packages but is most
often satisfied by either `ttf-dejavu` or `ttf-liberation`. A small subset of packages (including many based on Google's
chromium codebase) specifically depend on `ttf-liberation` which makes the liberation font set a hard requirement
whether want to use it or not.

This stub simply lies about fulfilling the `ttf-liberation` dependency while itself depending on a compatible MS font
package. This allows you to use the MS fonts in as your primary `ttf-font` provider and remove `ttf-liberation`.

#### License and Warning

I've tested this package extensively but there could still be bugs, use at your own risk.

PKGBUILD License: BSD, this only covers the packaging files; see your fonts source for their licensing info.

This package does not install, contain or link to any of the copyrighted fonts required to build the MS fonts packages,
you must create and install one of those packages first.

['ttf-ms-win10']: https://aur.archlinux.org/packages/ttf-ms-win10/
['ttf-ms-win11']: https://aur.archlinux.org/packages/ttf-ms-win11/
[//]: # ( vim: set tw=120: )
