# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.6.10
pkgrel=3
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-v$pkgver-$arch-unknown-linux-gnu")
sha256sums=('688f546ef4ba58f9cf091e7730e489139a282241be3784c4eecedda524763c4f')

package() {
  install -Dm755 fishnet-v$pkgver-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
