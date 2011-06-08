# Maintainer  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.46.1
pkgrel=3
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
source=(ftp://mirrors.kernel.org/archlinux/extra/os/i686/boost-libs-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
sha512sums=('3b4e1a9d894b21911bb25f6e40f0b8305d2f35cbb680d82dc935d45b69b519a38be2433199d06755300f2d3de8892583c6c7a07267743222981f9cb11b328311')


package() 
{
	mkdir -p ${pkgdir}/usr/lib32
	cp -P ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install ${srcdir}/usr/share/licenses/boost-libs/LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
