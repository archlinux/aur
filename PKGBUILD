# Contributor: JinguTech <xiuluo.android at gmail dot com>
# Contributor: Edison Ibañez <edison@opmbx.org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=sqlectron-gui
pkgver=1.39.0
pkgrel=1
pkgdesc="A simple and lightweight SQL client with cross database and platform support"
arch=(x86_64)
url='https://sqlectron.github.io'
license=('MIT')
depends=(glib2 hicolor-icon-theme)
source=("https://github.com/sqlectron/sqlectron-gui/releases/download/v${pkgver}/sqlectron-${pkgver}.pacman")
b2sums=('6def15f3e2c1b7b23d6e27b15283bff16d40fc07425621f1edef8530b33284c0c596a110560bea8b6ab670893931a98ef2ae7b7386f602c1eb41a114129d57b4')
noextract=("sqlectron-$pkgver.pacman")

package() {
  cd "$pkgdir"
  tar -xvf "$srcdir"/sqlectron-${pkgver}.pacman
  # Remove exsiting files
  rm -f .PKGINFO .MTREE .INSTALL
}
