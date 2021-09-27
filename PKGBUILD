# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/niklasf/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-gnu")
sha256sums=('a49d03a8209aedba06a1d7f5bf46997e05eee68c63f83ed3f2271817ef21147f')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
