# Maintainer: Manuel Bouças <zz64manu@gmail.com>
pkgname=woodo
pkgver=1.0
pkgrel=2
pkgdesc="A fun shell script recreating a classic joke."
arch=('any')
url="https://github.com/Manuzz64/woodo"
license=('MIT')
source=("woodo.sh")
sha512sums=('46839c7b97bdc16355b0c8753398fb6b85be07bee8c055c6693d29c4798a5a64dcfadbb82f15caaf3c7091ed345eccde45d6113b98f9db56b06c5b29e0f7c617')

package() {
    install -Dm755 "${srcdir}/woodo.sh" "${pkgdir}/usr/bin/woodo"
}
