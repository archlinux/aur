# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.31.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('4f2a3f22b12f870923504d4b6935535cad377b45859f5fe9419e3adc0611a48c')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
