# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=2.011
pkgrel=1
epoch=1
pkgdesc='Google Noto for Latin, Greek, Cyrillic scripts.'
arch=('any')
url='https://fonts.google.com/noto'
license=('OFL')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('a512e08f9cd058fd1b82f19fe5a4e7b784b5169c8c7832cacca76e5fc04e179a')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
