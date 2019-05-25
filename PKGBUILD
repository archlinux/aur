# Maintainer: bcclsn <a.buccato at gmail dot com>

pkgname=chibios
pkgver=19.1.2
pkgrel=1
pkgdesc="ChibiOS - free embedded RTOS"
arch=('any')
license=('GPL')
url="http://chibios.org"
source=("https://osdn.net/frs/redir.php?m=cznic&f=chibios%2F70739%2FChibiOS_${pkgver}.7z")
sha256sums=('05213876838ddd999582ae325f337f607a0db684ca277a81d7edada0a0b3adb8')

package() {
    mkdir -p ${pkgdir}/usr/src/chibios
    cp -r ${srcdir}/ChibiOS_${pkgver}/* ${pkgdir}/usr/src/chibios
}
