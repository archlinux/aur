# Maintainer: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=asco
pkgver=0.4.9
pkgrel=2
pkgdesc="A SPICE Circuit Optimizer."
arch=('i686' 'x86_64')
url="http://asco.sourceforge.net"
license=('GPL')
depends=(glibc)
conflicts=('qucs')
source=("http://downloads.sourceforge.net/sourceforge/asco/ASCO-$pkgver.tar.gz")
md5sums=('a279c9ba155e66ef8ccaf5f130fa236d')

build() {
  cd "$srcdir/ASCO-$pkgver"

  make || return 1
}

package(){
  install -D $srcdir/ASCO-$pkgver/asco "$pkgdir/usr/bin/asco"
}
# vim:set ts=2 sw=2 et:
