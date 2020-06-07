# Maintainer: MaxDy <max.davydovsky@gmail.com>

pkgname=ttf-pacifico
pkgver=3.000
pkgrel=1
pkgdesc="Pacifico is an original and fun brush script handwriting font by Vernon Adams which was inspired by the 1950s American surf culture. It was redrawn by Jacques Le Bailly and expanded to Cyrillic by Botjo Nikoltchev and Ani Petrova."
arch=('any')
url="https://fonts.google.com/specimen/Pacifico"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname.zip::https://fonts.google.com/download?family=Pacifico")
sha256sums=('576ca38f06e477cbe218af416657ec33b67bc98c5ddb626ebc8a1b2ab453e4b7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m 644 ${srcdir}/Pacifico-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m 644 $srcdir/OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
