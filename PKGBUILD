# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.30.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://broth.itch.zone/butler/linux-amd64/$pkgver/archive/default")
sha256sums=('05b9b0ddf98f9c592ea340302b246ad0e8d5afe4f35ff2d03fd6d7f5591647e6')

package() {
  install -Dm755 butler "$pkgdir/usr/bin/butler"
}
