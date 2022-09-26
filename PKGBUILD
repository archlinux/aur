# Maintainer: Nimble Bun Works <contact@nimblebun.works>

pkgname=wordle-cli-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='Play Wordle in your terminal.'
arch=(x86_64)
url='https://github.com/nimblebun/wordle-cli'
license=('MIT')
provides=('wordle')
conflicts=('wordle')
source=("$url/releases/download/v$pkgver/wordle_${pkgver}_linux_amd64")
sha256sums=('b08eba57240a5c12ae00d3c61f8ce048e1938b1921057698539dceec5b30992e')

package() {
  install -Dm755 "wordle_${pkgver}_linux_amd64" "$pkgdir/usr/bin/wordle"
}

