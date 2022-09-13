# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.4
pkgrel=2
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=('nix')
optdepends=('docker')
provides=('devbox')
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=("92ae5642b7069faf7a538ccacbe7f38402ec7925254c0b628d6119070b7efbe5")

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
