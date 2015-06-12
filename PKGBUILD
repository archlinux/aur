# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=tdu
pkgver=2008_05_07
pkgrel=2
pkgdesc="text-mode disk usage report tool"
arch=('i686' 'x86_64')
url="http://webonastick.com/tdu/"
license=('GPL')
depends=('ncurses' 'glib2')
source=("http://webonastick.com/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz")
md5sums=('3cf00f961d27964974e28dd2e69f2baf')

build() {
cd $srcdir/$pkgname
make
}

package() {
cd $srcdir/$pkgname
#prefix=$pkgdir/ make install
make install prefix=$pkgdir/usr
}
