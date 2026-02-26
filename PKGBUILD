# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.26.1
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('b724504bccf259eb01668e1d20b97f6e376d965761e306a75530e19225c510e3')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
