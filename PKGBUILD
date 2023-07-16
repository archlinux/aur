# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-v$pkgver-$arch-unknown-linux-gnu")
sha256sums=('0deb0dc7336448e90574e93fb058005db74d7e2f6d901a461984d6e810263471')

package() {
  install -Dm755 fishnet-v$pkgver-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
