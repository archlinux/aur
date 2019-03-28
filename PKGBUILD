# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=19.1.1
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://osdn.net/frs/redir.php?m=cznic&f=chibios%2F70739%2FChibiOS_${pkgver}.7z")
sha256sums=('b2b2c3fa6bdf373dabe983cae2f44591e7b0cef5a50a97394491aec5911a5907')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
