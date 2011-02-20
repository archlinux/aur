# Maintainer  : Dan Vratil <vratil@progdansoft.com>

pkgname=lib32-boost-libs
pkgver=1.45.0
pkgrel=1
_32pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${_32pkgrel}-i686.pkg.tar.xz)

package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	install ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/lib32-boost-libs
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/lib32-boost-libs
}
md5sums=('58297e01e296e6a95f9058c3582f5517')
