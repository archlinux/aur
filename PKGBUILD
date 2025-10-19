# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.14.0
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('38553e5a1785dede2b38e6d79dad201d02376b6cc10f7dc9952b337870e87c2d76391dc20c5affaa3f441631bfb617c68b13b468bf1217e35c59bf6cb7f98e92')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
