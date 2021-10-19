# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=cointop-bin
pkgver=1.6.9
pkgrel=1
pkgdesc="Cointop is a fast and lightweight interactive terminal based UI application for tracking and monitoring cryptocurrency coin stats in real-time"
arch=("x86_64")
url="https://github.com/miguelmota/cointop"
license=("Apache License 2.0")
provides=("cointop")
conflicts=("cointop" "cointop-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/cointop_${pkgver}_linux_amd64.tar.gz")
sha256sums=('916043e5a928f2b2b6d4260087708050e20d54ce83080415a9e8f06b88d0edc5')

package() {
  mkdir -p "$pkgdir/usr/local/bin"
  mv cointop "$pkgdir/usr/local/bin"
}
