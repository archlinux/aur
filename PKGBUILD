# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.24.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.ovh/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('bee1d708b5ed3dc7efcda3b5416ad5ca87a04d7e5fb6ebada510f3ba0cba3b69')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
