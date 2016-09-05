# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=linux-source
_pkgname=linux
pkgver=4.7.2
pkgrel=1
pkgdesc='Source files for the Linux Kernel'
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
options=('!strip')
license=('GPL2')

source=(
"https://www.kernel.org/pub/linux/kernel/v4.x/${_pkgname}-${pkgver}.tar.xz"
"https://www.kernel.org/pub/linux/kernel/v4.x/${_pkgname}-${pkgver}.tar.sign"
)

sha256sums=(
'58493ee6569484fab1658e680fbb7a72ad75f02211316628fe7ee5fd39f96488'
'SKIP')

validpgpkeys=(
'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
'647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

package() {
    mkdir -p ${pkgdir}/usr/src
    mv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
