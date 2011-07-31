# Maintainer  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.47.0
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
sha512sums=('5bdc8fc997c44371d6beadc80316c3971d81c1816df5b88337389e71c16b60674ddd4825fcb5980b288a276c8d797df3896cb595e993f67860863090fc0e12dd')


package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	cp -P ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
