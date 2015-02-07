# Maintainer: David McIlwraith <archaios at archaios dot net>
pkgname=libqcow
pkgver=20120522
pkgrel=1
pkgdesc="Library and tools to support QEMU copy-on-write image format (QCOW, QCOW2), including a FUSE-based mount utility"
url="http://code.google.com/p/libqcow/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fuse' 'openssl')
source=(http://libqcow.googlecode.com/files/$pkgname-alpha-$pkgver.tar.gz)
md5sums=('159703e5c34736d4fc38a509c62de1b9')

build(){
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
