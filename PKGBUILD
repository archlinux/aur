# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.7.1
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('30873743f82b660779b6a2c7ba045a72b8cd101b124afb37cb76a7ae485a400d714bee69c200a74ba55021babaa136289400ebce36323ebdedbccf78ff6e409c')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
