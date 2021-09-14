# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=cointop-bin
pkgver=1.6.8
pkgrel=1
pkgdesc="Cointop is a fast and lightweight interactive terminal based UI application for tracking and monitoring cryptocurrency coin stats in real-time"
arch=("x86_64")
url="https://github.com/miguelmota/cointop"
license=("Apache License 2.0")
provides=("cointop")
conflicts=("cointop" "cointop-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/cointop_${pkgver}_linux_amd64.tar.gz")
sha256sums=("875db5dca50b3e6a54ecacaa1b504b307d57fa7c444b6dac5f0d9925de27d912")

package() {
  mkdir -p "$pkgdir/usr/local/bin"
  mv cointop "$pkgdir/usr/local/bin"
}
