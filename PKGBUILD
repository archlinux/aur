# Maintainer: queueRAM <queueRAM+aur AT gmail.com>

pkgname=mips-linux-binutils-bin
pkgver=2.9.5
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (mips-linux)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/binutils/"
depends_i686=('glibc')
depends_x86_64=('lib32-glibc')
options=('!strip')
source=("ftp://ftp.linux-mips.org/pub/linux/mips/crossdev/i686-linux/mips-linux/binutils-mips-linux-${pkgver}-3.i386.rpm")
sha256sums=('1da33af71b846f40f28dd8cc07c9742cafb9352a53b81d0bac0d18cf503b98ad')

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -a ${srcdir}/usr/bin ${pkgdir}/usr
  cp -a ${srcdir}/usr/man ${pkgdir}/usr/share
  cp -a ${srcdir}/usr/mips-linux ${pkgdir}/usr
}
