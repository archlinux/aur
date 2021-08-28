
### `ttf-defenestration`

This package is a simple stub that allows you to remove the `ttf-liberation` package and replace it with fonts provided
by `ttf-ms-win10`. This package does not install, contain or link to any of the copyrighted fonts required to build
`ttf-ms-win10`, you must install that package first.

Why do this?

Most GUI packages depend on basic `ttf-font` availability; this functionality is provided by many packages but is most
often satisfied by either `ttf-dejavu` or `ttf-liberation`. A small subset of packages (including many based on Google's
chromium codebase) specifically depend on `ttf-liberation` which makes this font set a requirement whether you'd like to
use it or not. The Microsoft font packages fulfill the requirements of these packages equally well but thanks to this
dependency you're still forced to install the liberation fonts. This stub simply lies about fulfilling the
`ttf-liberation` dependency while itself depending on `ttf-ms-win10` allowing you to shoe-horn the MS fonts in as your
primary `ttf-font` provider and remove `ttf-liberation` anyway. You're already using the MS fonts, this lets you fully
exploit them as your core font provider.


Before you do *anything* with this PKGBUILD install ['ttf-ms-win10'](https://aur.archlinux.org/packages/ttf-ms-win10/)
first.

I've tested this package extensively but there could still be problems, use at your own risk.


License: BSD, do what you want with it.
