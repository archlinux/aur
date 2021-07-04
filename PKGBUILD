# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/niklasf/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-gnu")
sha256sums=('96da117146757e5fdc58f821e60bf495a33833b18bf43905a05a1a233cf4e250')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
