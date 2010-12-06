# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=sobby
pkgver=0.4.7
pkgrel=1
pkgdesc="Standalone obby server"
url="http://gobby.0x539.de/trac/"
license="GPL"
depends=('obby>=0.4.7' 'libxml++')
makedepends=('pkgconfig' 'net6>=1.3.12')
arch=('i686' 'x86_64')
source=(http://releases.0x539.de/sobby/sobby-$pkgver.tar.gz)
md5sums=('816ac9e2ecf2ac79306f9bbb80699464')
sha1sums=('ca20369eabce1657d090b310d78d4a35d697f28b')

build() {
  cd $srcdir/sobby-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
