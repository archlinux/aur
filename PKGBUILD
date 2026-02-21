# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.26.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('a425dfb5eb9a9fa5a628bceb91bcc04709660d1509302b9c58d23a7537219547')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
