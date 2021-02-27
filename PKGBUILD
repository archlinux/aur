# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=20.3.3
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://osdn.net/projects/chibios/downloads/72607/ChibiOS_${pkgver}.7z")
sha256sums=('4f9ecbbeb2e87977543dc0bf3a0552b791edd2246e99da4c91ea34013522a754')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
