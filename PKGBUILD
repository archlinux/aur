# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=17.6.3
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://sourceforge.net/projects/chibios/files/ChibiOS%20GPL3/Version%20${pkgver}/ChibiOS_${pkgver}.7z")
sha256sums=('324bfa79b332d887e7d549e1e2f3467fd28c2fd2632d844b5b430f01c13ad830')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
