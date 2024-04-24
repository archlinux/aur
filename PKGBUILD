# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.2
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
sha256sums=('b5c1a02416f0220beb6106e12a7b330932dec396291ae364af8f2153a1e1655d')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${pkgver}.Linux.${CARCH}/bin/crux"
}

