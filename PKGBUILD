# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-bin
pkgver=4.3.2
# _majorver="${pkgver%.*}"
pkgrel=1
pkgdesc="A mass spectrometry analysis toolkit"
arch=('x86_64')
url="http://crux.ms"
license=('Apache')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git")
source=("https://github.com/crux-toolkit/crux-toolkit/releases/download/crux-${pkgver}/crux-${pkgver}.Linux.${CARCH}.zip")
sha256sums=('d40735e7314ca6c1c0382e53869a1663e77d44191628d2c2909f1f814d9bbb15')

package() {
    install -D -t "${pkgdir}/usr/bin" "crux-${pkgver}.Linux.${CARCH}/bin/crux"
}

