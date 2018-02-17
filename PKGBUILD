# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=18.2.0
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://sourceforge.net/projects/chibios/files/ChibiOS%20GPL3/Version%20${pkgver}/ChibiOS_${pkgver}.7z")
sha256sums=('951545e073cb35c7d4768c36e39cfe83e3931655630147c54c4be7f53b9f66f0')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
