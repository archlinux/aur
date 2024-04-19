# Maintainer: Toolybird <toolybird at tuta dot io>

pkgname=driverctl
pkgver=0.115
pkgrel=1
pkgdesc="Device driver control utility"
arch=(any)
url="https://gitlab.com/driverctl/driverctl"
license=(LGPL-2.1-only)
depends=(bash)
makedepends=(systemd)
optdepends=('bash-completion: bash completion')
source=("https://gitlab.com/driverctl/driverctl/-/archive/$pkgver/driverctl-$pkgver.tar.bz2")
sha256sums=('6939c98527ce11ac2c5d740199ac91392ebd8f0577471d6b45d8a4b8750a40dd')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
}
