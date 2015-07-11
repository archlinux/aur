# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=linux-source
_pkgname=linux
pkgver=4.1.2
pkgrel=1
pkgdesc='Source files for the Linux Kernel'
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

package() {
    mkdir -p ${pkgdir}/usr/src
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
