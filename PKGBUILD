# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20230428
pkgrel=1
epoch=2
pkgdesc='Google Noto for Latin, Greek, Cyrillic scripts.'
arch=('any')
url='https://fonts.google.com/noto'
license=('OFL')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('e1d68ec2358e012a1e97a715644b676d0b914fd1f8af42596fe6468f151d2314')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
