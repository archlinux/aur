# Maintainer  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.46.1
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
md5sums=('7c11d662513ca76ac542cda64dbdbdc2')

package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	cp -P ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
