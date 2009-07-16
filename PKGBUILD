# $Id: PKGBUILD,v 1.7 2009/06/23 13:11:45 wonder Exp $
# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=openal
pkgname=lib32-$_pkgsourcename
pkgver=1.8.466
pkgrel=1
pkgdesc="OpenAL audio library for use with opengl"
url=("http://www.openal.org")
license=('LGPL')
arch=(x86_64)
groups=('lib32')
depends=('lib32-glibc')
source=(ftp://ftp.archlinux.org/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)
md5sums=('bccce439e3a305591d4e5d2b769ad31c')

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $startdir/pkg/opt/lib32/usr/lib
}
