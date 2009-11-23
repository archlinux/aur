# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=openal
pkgname=lib32-$_pkgsourcename
pkgver=1.10.622
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl"
url="http://www.openal.org"
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
sha256sums=('52c9c4043c2bc8a96d60e4dc295df483fb81cec0f6f3b7f6b5cdddfd44e7fc9c')
