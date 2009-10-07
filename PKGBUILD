# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=openal
pkgname=lib32-$_pkgsourcename
pkgver=1.9.563
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl"
url=("http://www.openal.org")
license=('LGPL')
arch=('x86_64')
groups=('lib32')
depends=('lib32-glibc')
source=(http://mir.archlinux.fr/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)

build() {
	cd $srcdir
	mkdir -p $pkgdir/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
md5sums=('47b2e351cc15751b80de1f9156cf2d82')
