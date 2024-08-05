# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.9.3
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL-3.0-only)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('2233993afd89f0f1f8dba94413b8faf2c3615ffdb67718b34aef239eb5c31bb0')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/${pkgname%-bin}"
}
