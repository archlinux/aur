# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.6.0
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('682affe95c3b3e6f3197f9266f25cd3e10232123cdd8a92139dd6e2e3223168745dbdb7871a465049c66b69e20daa67440e26c53737c987250f425faca685fe3')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
