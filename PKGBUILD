# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=19.1.0
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL3')
url="http://chibios.org"
source=("https://sourceforge.net/projects/chibios/files/ChibiOS%20GPL3/Version%20${pkgver}/ChibiOS_${pkgver}.7z")
sha256sums=("ae45990f054526805ca48d262f5a183c7ace0c003f12394dd8a7429d90f3d0e7")

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
