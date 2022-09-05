# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="devbox is a cli tool to easily create isolated shells and containers."
arch=('x86_64')
url="https://github.com/jetpack-io/devbox"
license=('Apache')
groups=()
depends=('nix')
makedepends=()
checkdepends=()
optdepends=('docker')
provides=('devbox-bin')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
noextract=()
sha256sums=("92ae5642b7069faf7a538ccacbe7f38402ec7925254c0b628d6119070b7efbe5")
validpgpkeys=()

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
