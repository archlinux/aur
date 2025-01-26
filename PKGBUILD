# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.9.4
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL-3.0-only)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('fccbd029abd4942f7365167c289be31cc21115693b02e1cab426b20292f68bb1')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/${pkgname%-bin}"
}
