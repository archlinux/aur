# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet-bin
pkgver=2.5.1
pkgrel=2
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=(x86_64)
url='https://github.com/niklasf/fishnet'
license=(GPL)
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/fishnet-$arch-unknown-linux-gnu")
sha256sums=('f45af03021c1e6316a3ec6a80f756b5a5058862aea0f6742c1ba833fc1b07b65')

package() {
  install -Dm755 fishnet-$arch-unknown-linux-gnu "$pkgdir/usr/bin/fishnet"
}
