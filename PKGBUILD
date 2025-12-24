# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.15.0
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('489c7ea6cabb4973af0e9c8b46aa86f0c4c7ef0b4529e87ccc1a8ffb3a771f648da7d16c09d58f2143d6e7a7d9005c152a3a3a05b4e76863eb5285e3a97dfa26')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
