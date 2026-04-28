# Maintainer: Toolybird <toolybird at tuta dot io>

pkgname=driverctl
pkgver=0.121
pkgrel=1
pkgdesc="Device driver control utility"
arch=(any)
url="https://gitlab.com/driverctl/driverctl"
license=(LGPL-2.1-only)
depends=(bash)
makedepends=(systemd)
optdepends=('bash-completion: bash completion')
source=("https://gitlab.com/driverctl/driverctl/-/archive/$pkgver/driverctl-$pkgver.tar.bz2")
sha256sums=('3d1e87cbcf22a1ed548f0fb0bdb9a1dbd3b4dcea0d23fd84444bd1673050b201')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
}
