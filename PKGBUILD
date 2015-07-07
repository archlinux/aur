# Maintainer: Maximilian Stein <theoddbird@posteo.org>
pkgname=getdata
pkgver=0.8.8
pkgrel=1
pkgdesc="The GetData Project is the reference implementation of the Dirfile Standards"
arch=('i686' 'x86_64')
url="http://getdata.sourceforge.net/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0d882786f9b958b73f241468bb3c8bc2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
 
