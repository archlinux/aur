# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.29.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('0568594aadf8bd437b6ca6d5eabc298d414a2ed7275068c5ee82485754db21c2')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
