# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.1.81a6e03
_majorver="${pkgver%.*}"
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64')
url="http://crux.ms"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://noble.gs.washington.edu/crux-downloads/daily/crux-${pkgver}.Linux.${CARCH}.zip")
sha256sums=('22c2147e1591b66edf7acce5329eb8ca8e53ab115a3b450c9d17873fbbb883df')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${_majorver}.Linux.${CARCH}/bin/crux" 
}

