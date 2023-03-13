# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.6.8
pkgrel=2
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-v$pkgver-$arch-unknown-linux-gnu")
sha256sums=('02201de74685f8ac4e3384756e3985dc3990aeb9126f6c599ab6c2d8af2897ec')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
