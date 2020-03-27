# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=20.3.0
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://osdn.net/projects/chibios/downloads/72607/ChibiOS_${pkgver}.7z")

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
