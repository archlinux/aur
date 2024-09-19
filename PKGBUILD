# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20240919
pkgrel=1
epoch=2
pkgdesc='Google Noto for Latin, Greek, Cyrillic scripts.'
arch=('any')
url='https://fonts.google.com/noto'
license=('OFL')
provides=('noto-fonts')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('e6ad6913361f4c518236795d6a720ad5e4e4dc09e3e93781f0d720cd92b3d927')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
