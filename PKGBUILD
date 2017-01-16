# Maintainer: Konstantin Oblaukhov <oblaukhov.konstantin@gmail.com>

pkgname=chibios
pkgver=16.1.6
pkgrel=2
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://sourceforge.net/projects/chibios/files/ChibiOS_RT%20stable/Version%20${pkgver}/ChibiOS_${pkgver}.7z")
sha256sums=('5418afba1aa21ebf1e7d59f363e1e418c4e3b9275b1eb5b1ce98e7f3e245d690')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
