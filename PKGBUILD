# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=sobby
pkgver=0.4.6
pkgrel=1
pkgdesc="Standalone obby server"
url="http://gobby.0x539.de/trac/"
license="GPL"
depends=('obby>=0.4.7' 'libxml++2')
makedepends=('pkgconfig')
arch=('i686' 'x86_64')
source=(http://releases.0x539.de/sobby/sobby-$pkgver.tar.gz)
md5sums=('7027e5da75d874dbd3c7e569d13027f8')
sha1sums=('253acb325d6edc1949616a7bbc1948aeb92044c3')

build() {
  cd $srcdir/sobby-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
