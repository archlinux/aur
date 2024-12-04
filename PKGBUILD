# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.23.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.ovh/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('8209afa4f2d23c78ef4f0d4a2b0e995347b1e9de2b43912842bbdf31543e1542')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
