# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=libxslt
pkgname=lib32-$_pkgsourcename
pkgver=1.1.26
pkgrel=1
pkgdesc="XML stylesheet transformation library"
url="http://www.xmlsoft.org/XSLT/"
license=('custom')
arch=('x86_64')
groups=('lib32')
depends=('lib32-glibc')
source=(ftp://ftp.archlinux.org/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)

build() {
	cd $srcdir
	mkdir -p $pkgdir/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
md5sums=('46134e42cba96503dd35262f8d4cd87c')
