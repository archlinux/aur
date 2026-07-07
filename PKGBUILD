# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.28.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('746de1eb9e0b8aba2b8aa766d3cfeacd92d69bcf06acf571a5b9a0faf28e3733')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
