# Maintainer: queueRAM <queueRAM+aur AT gmail.com>

pkgname=mips-linux-egcs-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Experimental GNU Compiler System (EGCS MIPS)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/gcc/"
depends=(mips-linux-binutils-bin)
depends_i686=(glibc)
depends_x86_64=(lib32-glibc)
options=('!strip')
source=(ftp://ftp.linux-mips.org/pub/linux/mips/crossdev/i686-linux/mips-linux/egcs-mips-linux-${pkgver}-4.i386.rpm)
sha256sums=('0f258ec59e1ae54cb2493d04f0366f56ae549b014f46e65f57ab2d3b45a55415')

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -a ${srcdir}/usr/bin "${pkgdir}/usr"
  cp -a ${srcdir}/usr/lib "${pkgdir}/usr"
  cp -a ${srcdir}/usr/man "${pkgdir}/usr/share"
}
