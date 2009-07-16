# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=libxslt
pkgname=lib32-$_pkgsourcename
pkgver=1.1.24
pkgrel=2
pkgdesc="XML stylesheet transformation library"
url="http://www.xmlsoft.org/XSLT/"
license=('custom')
arch=(x86_64)
groups=('lib32')
depends=('lib32-glibc')
source=(ftp://ftp.archlinux.org/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz)
md5sums=('689501be16ace709398f5b487e6c3b81')

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $startdir/pkg/opt/lib32/usr/lib
}
