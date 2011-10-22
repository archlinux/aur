# Maintainer  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.47.0
pkgrel=2
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
sha512sums=('1cf42d5d1f8417fc2003158ff3d66480e8bc1ccac439a31deca5d27b2a1f800358dbb3f614eff2d920bfe77f49d897e724077dd47469ec260827bebf69d5911e')

package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	cp -P ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
