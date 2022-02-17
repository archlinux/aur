# Maintainer: Victor Bonnelle <victor.bonnelle@protonmail.com>

pkgname=ttf-abril-fatface-google-fonts
pkgver=0
pkgrel=0
pkgdesc="Abril Fatface font from Google Fonts"
arch=('any')
url='https://fonts.google.com/specimen/Abril+Fatface'
license=('custom:OFL')
source=('https://fonts.google.com/download?family=Abril%20Fatface')
md5sums=('SKIP')

package() {
    install -Dm644 ${srcdir}/AbrilFatface-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/AbrilFatface-Regular.ttf
    install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}