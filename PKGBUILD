# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.25.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('4c1b87fed23d4addf8e51cca659e7552bcb242914c5bd5c14f5fac199fae2aa0')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
