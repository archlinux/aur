# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20230524
pkgrel=2
epoch=2
pkgdesc='Google Noto for Latin, Greek, Cyrillic scripts.'
arch=('any')
url='https://fonts.google.com/noto'
license=('OFL')
provides=('noto-fonts')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('b618391d9ce0b1fd4f2d3d953229fff991a67b48b74651711332688c6f8e12c2')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
