# Contributor: Maximilian Stein <theoddbird@posteo.org>

pkgname=getdata
pkgver=0.9.1
pkgrel=1
pkgdesc="reference implementation of the Dirfile Standards"
arch=('i686' 'x86_64')
url="http://getdata.sourceforge.net/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('5c30d01cfdf4c6aecbfc5544f3e49c5f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
