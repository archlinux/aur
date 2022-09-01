# Maintainer: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="[devbox] is a cli tool to easily create isolated shells and containers."
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
sha256sums=("faf6611c7d1cbbfee630089b01af86c5f5268e53ceafa46f5caf0877bfcce91e")
validpgpkeys=()

package() {
  install -D $srcdir/devbox $pkgdir/usr/bin/devbox
}
