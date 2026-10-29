# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.15.1
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL-3.0-only)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('0f4a71a7fcc11d0bfbce2d6868b402e8634ec0a930e84658a5e00d0fb0977011')

package() {
  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/${pkgname%-bin}"
}
