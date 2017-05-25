# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=linux-source
_pkgname=linux
pkgver=4.11.2
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
'bb149395a9e7e49728c824914c30943698e952693fbd1dd0106bad91a59f622c'
'SKIP')

validpgpkeys=(
'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
'647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

package() {
    mkdir -p ${pkgdir}/usr/src
    mv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
