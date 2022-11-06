# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.1.05bc272
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
sha256sums=('b65793d4208614401ec0f094508838ef02f3e2d9f9522d86a78b95acd093226f')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${_majorver}.Linux.${CARCH}/bin/crux" 
}

