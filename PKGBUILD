# Maintainer: Lai Jiang <jianglai@msn.com>

pkgname=plezy-bin
pkgver=1.24.1
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
arch=('x86_64')
url="https://github.com/edde746/plezy"
license=('GPL-3.0-or-later')
depends=()
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux-x64.pkg.tar.zst")
sha256sums=('fcddd85230cfa4bc2d25236b672708933e0adc5a1666a92b0420d96c58865ff1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

package() {
    cd "${srcdir}"

    # Copy opt and usr directories from the extracted Arch package
    cp -r opt "${pkgdir}/"
    cp -r usr "${pkgdir}/"
}
