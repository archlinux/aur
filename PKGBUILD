# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=glogg
pkgver=1.0.2
pkgrel=1
pkgdesc="A Qt GUI application to browse and search through long or complex log files."
arch=('i686' 'x86_64')
url="http://glogg.bonnefon.org/"
license=('GPL3')
depends=('qt4' 'boost-libs')
makedepends=('boost')
install="$pkgname.install"
source=("http://glogg.bonnefon.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('d6d9bb70ed50a38c5fa9114d71b52d3d')

build() {
  cd $pkgname-$pkgver
  qmake-qt4
  make
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
