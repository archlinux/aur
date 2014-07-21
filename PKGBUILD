# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.2
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt4')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b8483b2cfc4be460f347ed9342e3789f')

build() {
  cd $pkgname
  qmake-qt4
}

package() {
  cd $pkgname
  make install INSTALL_ROOT="$pkgdir/"
}
