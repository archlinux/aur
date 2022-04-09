# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.1.eb57164
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
sha256sums=('43f2916dc61398290d124c48322598073b6f37bd614450e95ad066958f0c423b')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${_majorver}.Linux.${CARCH}/bin/crux" 
}

