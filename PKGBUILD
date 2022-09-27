# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=('nix')
optdepends=('docker')
provides=('devbox')
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=("b5599600bc1ece12bb9575f5e9dc2ad1477a8cf84ae9984a9144cf0c3505c05c")

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
