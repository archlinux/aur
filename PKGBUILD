# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-charis-sil
pkgver=6.000
pkgrel=1
pkgdesc='Font family supporting Latin and Cyrillic scripts. Designed for legibility and publishing.'
arch=('any')
url='https://software.sil.org/charis/'
license=('OFL')
source=("https://software.sil.org/downloads/r/charis/CharisSIL-${pkgver}.zip")
sha256sums=('9920fc3bfd07a9b43a3472aed9af41309f3b80a4186766ceff480c35275ef897')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/CharisSIL-${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/CharisSIL-${pkgver}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
