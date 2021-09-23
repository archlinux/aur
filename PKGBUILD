# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20210923
pkgrel=1
pkgdesc='Google Noto fonts: Sans, Sans Display, Sans Mono, Serif, Serif Display'
arch=('any')
url='https://fonts.google.com/noto'
license=('OFL')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('74f01aafbb7c3be81b36bd4d89334fb0cebbd500535700f0648f9b94852fcaae')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
