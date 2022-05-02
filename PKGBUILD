# Maintainer: Nimble Bun Works <contact@nimblebun.works>

pkgname=wordle-cli-bin
pkgver=1.0.8
pkgrel=1
pkgdesc='Play Wordle in your terminal.'
arch=(x86_64)
url='https://github.com/nimblebun/wordle-cli'
license=('MIT')
provides=('wordle')
conflicts=('wordle')
source=("$url/releases/download/v$pkgver/wordle_${pkgver}_linux_amd64")
sha256sums=('37f315cb44f128cbe1d592ac669de4099fbd7f89e24ded80097acdb6c7cdb366')

package() {
  install -Dm755 "wordle_${pkgver}_linux_amd64" "$pkgdir/usr/bin/wordle"
}

