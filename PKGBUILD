# Maintainer: Nimble Bun Works <contact@nimblebun.works>

pkgname=wordle-cli-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Play Wordle in your terminal.'
arch=(x86_64)
url='https://github.com/nimblebun/wordle-cli'
license=('MIT')
provides=('wordle')
conflicts=('wordle')
source=("$url/releases/download/v$pkgver/wordle_${pkgver}_linux_amd64")
sha256sums=('d62927869be39916e8b5eb3a43f65f43384302e78d84662b1c53953e536a5ce8')

package() {
  install -Dm755 "wordle_${pkgver}_linux_amd64" "$pkgdir/usr/bin/wordle"
}

