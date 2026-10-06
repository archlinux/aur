# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.32.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('2335971394ef6596f95ded0833e85ee28755e13761716ef4c91d6b11f69162f5')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
