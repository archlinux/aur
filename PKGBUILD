# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=regressi-bin
pkgver=1.8.0
pkgrel=2
pkgdesc="Regressi allows you to calculate combined quantities into a function of differential equational."
arch=("x86_64")

url='http://regressi.fr'
makedepends=()
depends=()
license=('none')
sha512sums=(
  'bb8490c86a63580ab40dbac7e504d8f4819a738486db78048ed9f92b44a14cd3a4b892f8417d87c166361a5c9761536bc3c53c6591eea3e9d575a5a44f63fcc1' 
  'fc7d8ee6337917d7bf23bdec1157cf5bcf90cc90d1bb012374d2da83d519047167778484706a108466eef8c0136f1a4b612adc85b7cef163eec804c4a5cad19c'
)

source=(http://regressi.fr/zip/regressiM regressi.desktop)

package() {
  install -D regressi.desktop "$pkgdir/usr/share/applications/regressi.desktop"
  install -D regressiM "$pkgdir/usr/bin/regressi"
}
