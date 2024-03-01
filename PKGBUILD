# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.9.0
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-musl")
sha256sums=('f3898cdf9b75e0a291606f5022d424998d1d35652f9dd9b8c9a9d96298018258')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-musl "$pkgdir/usr/bin/fishnet"
}
