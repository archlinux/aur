
### `ttf-defenestration`

This package is a simple stub that allows you to remove the `ttf-liberation` package and replace it with fonts provided
by `ttf-ms-win10`. This package does not install, contain or link to any of the copyrighted fonts required to build
`ttf-ms-win10`, you must install that package first.

Why do this?

Every sane package depends on basic `ttf-font` availability; this functionality is provided by many packages but is most
often satisfied by either `ttf-dejavu` or `ttf-liberation`. Only two packages, `chromium` and `google-chrome`, actually
depend on a specific font provider and for some unknown obnoxious reason both explicitly require `ttf-liberation`. The
Microsoft font packages fulfill the font requirements of both of these; this stub allows you to shoe-horn the MS fonts
in as your primary `ttf-font` provider and remove this stubborn dependency. You're already using the MS fonts, this lets
you fully exploit them as your core font provider.


Before you do *anything* with this PKGBUILD install ['ttf-ms-win10'](https://aur.archlinux.org/packages/ttf-ms-win10/)
first.

I've tested this package extensively but there could still be problems, use at your own risk.


License: BSD, do what you want with it.
