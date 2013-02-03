# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.0
pkgrel=1
pkgdesc="A native YouTube client in QT. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL')
depends=('phonon')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7df1e44b86a4744a492ccc414c0fa77d')

build() {
  cd "$srcdir/$pkgname"
  qmake
}

package() {
  cd "$srcdir/$pkgname"
  make install INSTALL_ROOT="$pkgdir/"
}
