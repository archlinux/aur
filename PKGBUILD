# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.12.0
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL-3.0-only)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('bbe08d82eb30516d25305ce7a058b3b106dca3a3859867211a218d924781a8ce')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/${pkgname%-bin}"
}
