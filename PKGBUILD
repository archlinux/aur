# Maintainer: Vladimir Cerny <blackvladimir@gmail.com>
pkgname=asco
pkgver=0.4.10
pkgrel=1
pkgdesc="A SPICE Circuit Optimizer."
arch=('i686' 'x86_64')
url="http://asco.sourceforge.net"
license=('GPL')
depends=(glibc)
source=("http://downloads.sourceforge.net/sourceforge/asco/ASCO-$pkgver.tar.gz")
md5sums=('f8832f010f1f0d930878da903a59b028')

build() {
  cd "$srcdir/ASCO-$pkgver"
  make
}

package(){
  install -D $srcdir/ASCO-$pkgver/asco "$pkgdir/usr/bin/asco"
}
# vim:set ts=2 sw=2 et:
