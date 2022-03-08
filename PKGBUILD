# Maintainer: Nimble Bun Works <contact@nimblebun.works>

pkgname=wordle-cli-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='Play Wordle CLI in your terminal.'
arch=(x86_64)
url='https://github.com/nimblebun/wordle-cli'
license=('MIT')
provides=('wordle')
conflicts=('wordle')
source=("$url/releases/download/v$pkgver/wordle_${pkgver}_linux_amd64")
sha256sums=('ddcfa2cbe46d6875d62916cd28dd262ad6b133da1359aa4c4b1314eb92d3138c')

package() {
  install -Dm755 "wordle_${pkgver}_linux_amd64" "$pkgdir/usr/share/games/wordle"
}

