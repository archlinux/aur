# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.1.3
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b43df4358de2e170d7e22370b39bd1ec')

build() {
  cd $pkgname
  qmake-qt4
}

package() {
  cd $pkgname
  make install INSTALL_ROOT="$pkgdir/"
}
