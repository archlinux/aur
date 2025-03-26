# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.3
_majorver="${pkgver%.*}"
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64')
url="http://crux.ms"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://github.com/crux-toolkit/crux-toolkit/releases/download/crux-${pkgver}/crux-${pkgver}.Linux.${CARCH}.zip")
sha256sums=('6928384fef11a8ecfc4f94cc57fc20e6ce819e6d82cf6bde1e733bb85a81e80d')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${pkgver}.Linux.${CARCH}/bin/crux"
}

