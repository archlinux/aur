# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.3
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt4')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8c9dba9b0190a740fab6c38c5d79c3f8')

build() {
  cd $pkgname
  qmake-qt4
}

package() {
  cd $pkgname
  make install INSTALL_ROOT="$pkgdir/"
}
