# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20190926
pkgrel=1
pkgdesc='Google Noto fonts: Sans, Sans Display, Sans Mono, Serif, Serif Display'
arch=('any')
url='https://www.google.com/get/noto/'
license=('OFL')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.zst")
sha256sums=('ea429d4928a279f0950a11ea75b788292891bf8ef0f3faadbedb23bb37834fd4')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/${pkgname}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
