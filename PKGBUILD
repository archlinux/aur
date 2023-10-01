# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20230930
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
sha256sums=('36a01570546c0f2fbdabdc23b286117126c1f12b7458084df1d78d1ffd037c1b')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
