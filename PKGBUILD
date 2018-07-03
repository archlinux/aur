# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=noto-fonts-main
pkgver=20180703
pkgrel=1
pkgdesc='Google Noto fonts: Sans, Sans Display, Sans Mono, Serif, Serif Display'
arch=('any')
url='https://www.google.com/get/noto/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('noto-fonts'
           'noto-fonts-extra')
source=("https://www.markusweimar.de/public/noto-fonts-main-${pkgver}.tar.xz")
sha256sums=('7aa0c83cfb557f3c587d6928ef4d3a8af2916354c82aafb24fcfa4c8a8ba6d12')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -t ${pkgdir}/usr/share/fonts/${pkgname}/ -m644 ${srcdir}/noto-fonts-main/fonts/*.ttf
    install -D -m644 ${srcdir}/noto-fonts-main/LICENSE_OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_OFL.txt
}
