# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
depends=('nix')
optdepends=('docker')
provides=('devbox')
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=("d6ce91848d2f14872cda25464c7de9609fb71f6d0a41d28469c72aebb251c6d0")

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
