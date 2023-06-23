# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.10.0
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cf2f83bb4c164144ad058bc7c546ee9b9a9367266b6dd263dec7eec494aed689abc952346a1e86a6a643c56f17869b590e72a08b9270b7f27e73af662fe7be2d')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
