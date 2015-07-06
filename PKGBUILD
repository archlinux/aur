# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=xdf
pkgver=1.4.37
pkgrel=1
pkgdesc="An exquisite version of df, reporting file system disk space usage."
arch=('i686' 'x86_64')
url="http://botao.org/xdf.1.html"
license=('Apache')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver-src.tar.gz)
md5sums=('592c361ed49a75b11049508ced945838')

build() {
  cd "$srcdir/${pkgname}1"
  ./configure
  make  
}

package() {
  cd "$srcdir/${pkgname}1"
  install -Dm 755 xdf $pkgdir/usr/bin/xdf
  install -Dm 644 xdf.1 $pkgdir/usr/share/man/man1/xdf.1
}

# vim:set ts=2 sw=2 et:
