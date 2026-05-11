# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.27.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('b9f0d6eef33036031cafaf59939d9f3bc724e2b674c510d4a9cf8a9f1008e299')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
