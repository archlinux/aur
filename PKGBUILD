# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20170919
pkgrel=1
pkgdesc='Google Noto fonts: Sans, Sans Display, Sans Mono, Sans Symbols, Sans UI, Serif, Serif Display'
arch=('any')
url='http://www.google.com/get/noto/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.xz")
sha256sums=('85c51059195ff0b0c5b9bf394850a92583cc4b43f1b694052c7b54c46a0282c9')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -t ${pkgdir}/usr/share/fonts/${pkgname}/ -m644 ${srcdir}/noto-fonts-main/fonts/*.ttf
    install -D -m644 ${srcdir}/noto-fonts-main/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
