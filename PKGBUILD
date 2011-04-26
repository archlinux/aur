# Maintainer  : Dan Vratil <vratil@progdansoft.com>

pkgname=lib32-boost-libs
pkgver=1.46.0
pkgrel=1
_32pkgrel=4
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${_32pkgrel}-i686.pkg.tar.xz)
md5sums=('befd0fbe78ced94f0f7c6493697e8b9c')

package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	cp -P ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/lib32-boost-libs
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/lib32-boost-libs
}
