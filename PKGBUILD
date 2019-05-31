# Maintainer:  Rachid Zarouali <xinity77@gmail.com>

pkgname=duffle-bin
pkgver=0.1.0
pkgsubver=-ralpha.5+englishrose
pkgrel=1
pkgdesc="CNAB installer"
url="https://github.com/deislabs/duffle"
arch=('x86_64')
license=('MIT')
options=(!strip)
source=(
  "duffle-$pkgver::https://github.com/deislabs/duffle/releases/download/$pkgver$pkgsubver/duffle-linux-amd64"
)

sha256sums=('0f1187d3afc284016d552f1ffa5095514a8535288d2ee65afd32d2757e33a285')

package() {
  cd "$srcdir"
  install -Dm755 "duffle-$pkgver" "$pkgdir/usr/bin/duffle"
}

# vim:set ts=2 sw=2 et:
