# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.1.6
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt4')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-1.2.6.tar.gz") # tagging mismatch
md5sums=('b5a7794cad661d47e0e856b864f774af')

build() {
  cd $pkgname
  qmake-qt4
}

package() {
  cd $pkgname
  make install INSTALL_ROOT="$pkgdir/"
}
