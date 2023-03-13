# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.6.8
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-v$pkgver-$arch-unknown-linux-gnu")
sha256sums=('cb550dfe90fdc7660869a30638f930403045cf9a5a239add28d41cb38b6a27de')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
