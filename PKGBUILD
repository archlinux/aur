# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=18.2.1
pkgrel=3
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL3')
url="http://chibios.org"
source=("https://sourceforge.net/projects/chibios/files/ChibiOS%20GPL3/Version%20${pkgver}/ChibiOS_${pkgver}.7z")
sha1sums=("eb908a58bd3285b5f9ade8889f73d25d876a7bfd")

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
