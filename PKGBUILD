# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-roadgeek
pkgver=3.10
_pkgver=3.1
pkgrel=1
pkgdesc="Michael Adams' Roadgeek Fonts - 2014 Edition"
url="https://github.com/sammdot/roadgeek-fonts"
arch=(any)
license=("MIT")

source=("RG2014-${pkgver}.zip::https://github.com/sammdot/roadgeek-fonts/releases/download/${_pkgver}/RG2014-${pkgver}.zip"
        "LICENSE.TXT::https://raw.githubusercontent.com/sammdot/roadgeek-fonts/master/LICENSE"
)
sha512sums=('40dfa8843cfeee256b0d3efb0d607543986e1721e13c3fa852eda191d336010596b0af75331c21609d717ed0fcf1c3370761bf2a252866d8ec940a66bce5b051'
            'd2f9764ec52c431190f6537657adfdf00f3390f11be53183990d3c2da6eeeeea4b922110ecf434c3726cc0e0afa89a6227221001d35e9817cd11b04efa748980')

package_ttf-roadgeek() {
    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.TXT
}

# vim:set ts=2 sw=2 et:
