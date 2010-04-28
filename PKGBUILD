# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=openal
pkgname=lib32-$_pkgsourcename
pkgver=1.12.854
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl"
url="http://www.openal.org"
license=('LGPL')
arch=('x86_64')
groups=('lib32')
depends=('lib32-glibc')
source=(http://mir.archlinux.fr/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.xz)

build() {
	cd $srcdir
	mkdir -p $pkgdir/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
md5sums=('acf8e2a2bba4edde4268f89370e71d00')
sha256sums=('19de8f895a849d6d2ed19a707db8c7f623b4f3616ed1cb84ee47fe372626ce33')
