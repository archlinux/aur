# Maintainer: Denis Borisevich <elfmax at tut dot by>
pkgname=xml-coreutils
pkgver=0.8.1
pkgrel=1
url="http://xml-coreutils.sourceforge.net"
pkgdesc="A collection of Unix/POSIX command line tools for processing XML files."
license=('GPL3')
arch=('x86_64' 'i686')
depends=('slang' 'expat')
source=("http://downloads.sourceforge.net/xml-coreutils/$pkgname-$pkgver.tar.gz")
md5sums=('44eea36f296f70a35384d1c552fc5131')
build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

