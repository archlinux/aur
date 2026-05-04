# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.13.2
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL-3.0-only)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('470ad86524fb3fedc4445e6d8e2f1808a8b1cbd53fbc8d30574ee65225f898c2')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/${pkgname%-bin}"
}
