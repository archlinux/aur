# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=('nix')
optdepends=('docker')
provides=('devbox')
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=("be3b42f407906e07535bbed2fe4ced14ecd18f9fca0936ad7c1cc2a73df1fb33")

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
