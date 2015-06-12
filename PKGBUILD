# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=dugroup
pkgver=2008_05_07
pkgrel=1
pkgdesc="commandline tool for (visual) grouping of files with same extensions. useful in combination with tdu."
arch=('any')
url="http://webonastick.com/tdu/"
license=('GPL')
source=("http://webonastick.com/tdu/${pkgname}-${pkgver//_/-}.tar.gz")
md5sums=('7f0379b8ffd8937d486a32faede70cb4')

build() {
true
}

package() {
cd $srcdir/$pkgname
make install prefix=$pkgdir/usr
}
