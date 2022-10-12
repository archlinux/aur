# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=('nix')
optdepends=('docker')
provides=('devbox')
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=("26619d75521d1acb8a5fbc532281afee45c2e57b40cc1d62a94a0de4667469d0")

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
